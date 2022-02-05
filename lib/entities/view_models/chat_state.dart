import 'package:action_cable/action_cable.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

enum connectionState {
  connecting,
  connected,
  connectionLost,
  connectionFailed,
  disconnected
}

@freezed
class ChatState with _$ChatState {
  const ChatState._();

  factory ChatState({
    @Default(1) int pageNumber,
    @Default(true) bool initialLoading,
    @Default(true) bool messagesLeft,
    ActionCable? cable,
    @Default(0) int retryCount,
    int? closedBy,
    @Default(false) bool matchClosed,
    @Default(connectionState.connecting) connectionState connection,
    @Default(false) bool connectionStateVisible,
    @Default(<Message>[]) List<Message> messages,
  }) = _ChatState;

  ChatState withMessage(Message newMessage) {
    return copyWith(
        messages: List.from(messages)
          ..remove(messages
              .firstWhereOrNull((message) => message.id == newMessage.id))
          ..add(newMessage)
          ..sort((a, b) => b.createdAt!.compareTo(a.createdAt!)));
  }
}
