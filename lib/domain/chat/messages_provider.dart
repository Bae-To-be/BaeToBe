import 'dart:async';

import 'package:action_cable/action_cable.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/auth_provider.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/match.dart';
import 'package:baetobe/entities/user.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:collection/collection.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

final messagesProvider = StateNotifierProvider.autoDispose
    .family<MessagesNotifier, ChatState, Match>((ref, match) {
  final user = ref.watch(userProvider);
  return MessagesNotifier(ref, match, user);
});

enum connectionState {
  connecting,
  connected,
  connectionLost,
  connectionFailed,
  disconnected
}

const uuid = Uuid();

class MessagesNotifier extends StateNotifier<ChatState>
    with WidgetsBindingObserver {
  final Ref ref;
  final Match match;
  final User user;

  MessagesNotifier(this.ref, this.match, this.user) : super(ChatState()) {
    state = state.copyWith(
        newMatchClosed: match.isClosed, newClosedBy: match.closedBy);
    _setupCable();
    updateMessages().then((_) => WidgetsBinding.instance?.addObserver(this));
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    state.cable?.disconnect();
    super.dispose();
  }

  @override
  //ignore: avoid_renaming_method_parameters
  void didChangeAppLifecycleState(AppLifecycleState appState) {
    super.didChangeAppLifecycleState(appState);
    if (appState == AppLifecycleState.resumed) {
      state = state.copyWith(
          newRetryCount: 0, newPageNumber: 1, newMessagesLeft: true);
      updateMessages();
      _setupCable();
    }
  }

  Future<void> updateMessages() async {
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);
    await error.safelyExecute(
        command: client.get(
            BackendRoutes.listMessages
                .replaceAll('%{match_id}', match.id.toString()),
            queryParameters: {'page': state.pageNumber}),
        onSuccess: (response) {
          if (!mounted) {
            return Future.value(null);
          }
          state = state.copyWith(newPageNumber: state.pageNumber + 1);
          if (response.data['data'].isEmpty) {
            state = state.copyWith(newMessagesLeft: false);
          }
          for (var message in response.data['data']) {
            _addOrReplace(message);
          }
          var newState = state;

          for (var messageData in response.data['data']) {
            newState = newState.withMessage(_jsonToMessage(messageData));
          }
          if (state.initialLoading) {
            state = newState.copyWith(newInitialLoading: false);
          }
          return Future.value(null);
        });
  }

  Future<void> sendMessage(types.PartialText text) async {
    final id = uuid.v4();
    types.Status status = types.Status.sending;
    try {
      state.cable?.performAction('Chat',
          action: 'send_message',
          channelParams: _channelParams(),
          actionParams: {'text': text.text, 'client_id': id});
    } catch (e) {
      status = types.Status.error;
    }
    state = state.withMessage(_newMessage(id, text.text, status));
  }

  void deleteMessage(String remoteId) {
    state.cable?.performAction('Chat',
        action: 'delete_message',
        channelParams: _channelParams(),
        actionParams: {'message_id': remoteId});
  }

  void _addOrReplace(Map<String, dynamic> json) {
    state = state.withMessage(_jsonToMessage(json));
  }

  Future<void> _setupCable() async {
    if (state.matchClosed) {
      return;
    }

    state = state.copyWith(newConnection: connectionState.connecting);
    if (!state.connectionStateVisible) {
      state = state.copyWith(newConnectionStateVisible: true);
    }
    state.cable?.disconnect();

    final stopwatch = Stopwatch()..start();
    final _cable = ActionCable.Connect(
        FirebaseRemoteConfig.instance.getString('CHAT_HOST'),
        headers: {
          'Authorization':
              'Bearer ${await ref.read(authProvider.notifier).getAccessToken()}'
        }, onConnected: () {
      FirebaseAnalytics.instance.logEvent(
          name: 'CHAT_CONNECTION_CREATED',
          parameters: {'duration': stopwatch.elapsedMilliseconds});
      if (!mounted) {
        return;
      }
      state = state.copyWith(newConnection: connectionState.connected);
      Timer(const Duration(milliseconds: 5000), () {
        state = state.copyWith(newConnectionStateVisible: false);
      });
    }, onConnectionLost: () {
      FirebaseAnalytics.instance.logEvent(
          name: 'CHAT_CONNECTION_LOST',
          parameters: {'duration': stopwatch.elapsedMilliseconds});
      if (!mounted) {
        return;
      }
      state = state.copyWith(newConnection: connectionState.connectionLost);
      if (state.retryCount <
          FirebaseRemoteConfig.instance.getInt('CHAT_MAX_CONNECT_RETRY')) {
        state = state.copyWith(newRetryCount: state.retryCount + 1);
        _setupCable();
      }
    }, onCannotConnect: () {
      FirebaseAnalytics.instance.logEvent(
          name: 'CHAT_CONNECTION_FAILED',
          parameters: {'duration': stopwatch.elapsedMilliseconds});
      if (!mounted) {
        return;
      }
      state = state.copyWith(newConnection: connectionState.connectionFailed);
      if (state.retryCount <
          FirebaseRemoteConfig.instance.getInt('CHAT_MAX_CONNECT_RETRY')) {
        state = state.copyWith(newRetryCount: state.retryCount + 1);
        _setupCable();
      }
    });
    state = state.copyWith(newCable: _cable);

    state.cable?.subscribe('Chat', channelParams: _channelParams(),
        onSubscribed: () {
      debugPrint('subscribed');
    }, onDisconnected: () {
      state = state.copyWith(newConnection: connectionState.disconnected);
    }, onMessage: (Map message) {
      if (kDebugMode) {
        debugPrint(message.toString());
      }
      if (!mounted) {
        return;
      }
      if (['new_message', 'message_updated'].contains(message['event'])) {
        _addOrReplace(message['data']);
      }
      if (message['event'] == 'match_closed') {
        state = state.copyWith(
            newMatchClosed: true, newClosedBy: message['closed_by']);
        state.cable?.disconnect();
      }
    });
  }

  types.Message _newMessage(String id, String text, types.Status status) {
    return types.TextMessage(
        author: types.User(id: user.id.toString(), firstName: user.name),
        status: status,
        metadata: const {'isDeleted': false},
        createdAt: DateTime.now().toUtc().millisecondsSinceEpoch,
        id: id,
        roomId: id,
        text: text,
        updatedAt: DateTime.now().toUtc().millisecondsSinceEpoch);
  }

  types.Message _jsonToMessage(Map<String, dynamic> json) {
    types.Status? status;
    if (json['author']['id'] == user.id) {
      final notUser =
          json['unread_by'].keys.firstWhere((id) => id != user.id.toString());
      if (json['unread_by'][notUser] as bool) {
        status = types.Status.sent;
      } else {
        status = types.Status.seen;
      }
    } else {
      if (json['unread_by'][user.id.toString()] as bool) {
        state.cable?.performAction('Chat',
            action: 'mark_as_read',
            channelParams: _channelParams(),
            actionParams: {'message_id': json['id']});
      }
    }

    return types.TextMessage(
      author: types.User(
          id: json['author']['id'].toString(),
          firstName: json['author']['name']),
      status: status,
      createdAt: int.parse(json['created_at']),
      id: json['client_id'],
      remoteId: json['id'],
      metadata: {'isDeleted': json['is_deleted']},
      roomId: match.id.toString(),
      text: json['content'],
      updatedAt: int.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> _channelParams() {
    return {'match_id': match.id};
  }
}

const List<types.Message> initialMessages = [];

class ChatState {
  int pageNumber;
  bool initialLoading;
  bool messagesLeft;
  ActionCable? cable;
  int retryCount;
  int? closedBy;
  bool matchClosed;
  connectionState connection;
  bool connectionStateVisible;
  List<types.Message> messages;

  ChatState(
      {this.pageNumber = 1,
      this.messagesLeft = true,
      this.messages = initialMessages,
      this.initialLoading = true,
      this.cable,
      this.retryCount = 0,
      this.closedBy,
      this.matchClosed = false,
      this.connectionStateVisible = false,
      this.connection = connectionState.connecting});

  ChatState copyWith(
      {int? newPageNumber,
      bool? newMessagesLeft,
      ActionCable? newCable,
      int? newRetryCount,
      int? newClosedBy,
      bool? newMatchClosed,
      bool? newInitialLoading,
      List<types.Message>? newMessages,
      connectionState? newConnection,
      bool? newConnectionStateVisible}) {
    return ChatState(
        pageNumber: newPageNumber ?? pageNumber,
        messagesLeft: newMessagesLeft ?? messagesLeft,
        cable: newCable ?? cable,
        retryCount: newRetryCount ?? retryCount,
        closedBy: newClosedBy ?? closedBy,
        initialLoading: newInitialLoading ?? initialLoading,
        matchClosed: newMatchClosed ?? matchClosed,
        messages: newMessages ?? messages,
        connectionStateVisible:
            newConnectionStateVisible ?? connectionStateVisible,
        connection: connectionState.connecting);
  }

  ChatState withMessage(types.Message newMessage) {
    return copyWith(newMessages: messages.addOrReplace(newMessage));
  }
}

extension ReplaceMessage on List<types.Message> {
  List<types.Message> addOrReplace(types.Message newMessage) {
    return List.from(this)
      ..remove(firstWhereOrNull((message) => message.id == newMessage.id))
      ..add(newMessage)
      ..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
  }
}
