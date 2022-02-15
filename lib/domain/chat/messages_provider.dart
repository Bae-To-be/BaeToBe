import 'dart:async';

import 'package:action_cable/action_cable.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/auth_provider.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/data/match.dart';
import 'package:baetobe/entities/data/user.dart';
import 'package:baetobe/entities/view_models/chat_state.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
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

const uuid = Uuid();

class MessagesNotifier extends StateNotifier<ChatState>
    with WidgetsBindingObserver {
  final Ref ref;
  final Match match;
  final User user;

  MessagesNotifier(this.ref, this.match, this.user) : super(ChatState()) {
    state =
        state.copyWith(matchClosed: match.isClosed, closedBy: match.closedBy);
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
      state = state.copyWith(retryCount: 0, pageNumber: 1, messagesLeft: true);
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
          state = state.copyWith(pageNumber: state.pageNumber + 1);
          if (response.data['data'].isEmpty) {
            state = state.copyWith(messagesLeft: false);
          }
          for (var message in response.data['data']) {
            _addOrReplace(message);
          }
          var newState = state;

          for (var messageData in response.data['data']) {
            newState = newState.withMessage(_jsonToMessage(messageData));
          }
          if (state.initialLoading) {
            state = newState.copyWith(initialLoading: false);
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

    state = state.copyWith(
        connection: connectionState.connecting, connectionStateVisible: true);
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
      state = state.copyWith(connection: connectionState.connected);
      Timer(const Duration(milliseconds: 500), () {
        if (!mounted) {
          return;
        }
        state = state.copyWith(connectionStateVisible: false);
      });
    }, onConnectionLost: () {
      FirebaseAnalytics.instance.logEvent(
          name: 'CHAT_CONNECTION_LOST',
          parameters: {'duration': stopwatch.elapsedMilliseconds});
      if (!mounted) {
        return;
      }
      if (kDebugMode) {
        debugPrint('CONNECT TO SOCKET LOST');
      }
      state = state.copyWith(
          connection: connectionState.connectionLost,
          connectionStateVisible: true);
      if (state.retryCount <
          FirebaseRemoteConfig.instance.getInt('CHAT_MAX_CONNECT_RETRY')) {
        state = state.copyWith(retryCount: state.retryCount + 1);
        _setupCable();
      }
    }, onCannotConnect: () {
      FirebaseAnalytics.instance.logEvent(
          name: 'CHAT_CONNECTION_FAILED',
          parameters: {'duration': stopwatch.elapsedMilliseconds});
      if (!mounted) {
        return;
      }
      if (kDebugMode) {
        debugPrint('CANNOT CONNECT TO SOCKET');
      }
      state = state.copyWith(
          connection: connectionState.connectionFailed,
          connectionStateVisible: true);
      if (state.retryCount <
          FirebaseRemoteConfig.instance.getInt('CHAT_MAX_CONNECT_RETRY')) {
        state = state.copyWith(retryCount: state.retryCount + 1);
        _setupCable();
      }
    });
    state = state.copyWith(cable: _cable);

    state.cable?.subscribe('Chat', channelParams: _channelParams(),
        onSubscribed: () {
      debugPrint('subscribed');
    }, onDisconnected: () {
      if (!mounted) {
        return;
      }
      state = state.copyWith(
          connection: connectionState.disconnected,
          connectionStateVisible: true);
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
        state =
            state.copyWith(matchClosed: true, closedBy: message['closed_by']);
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
    if (json['author']['id'] != user.id) {
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
      status: types.Status.sent,
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
