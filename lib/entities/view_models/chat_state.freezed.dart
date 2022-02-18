// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatStateTearOff {
  const _$ChatStateTearOff();

  _ChatState call(
      {int pageNumber = 1,
      bool initialLoading = true,
      bool messagesLeft = true,
      ActionCable? cable,
      int retryCount = 0,
      int? closedBy,
      bool matchClosed = false,
      ChatConnectionState connection = ChatConnectionState.connecting,
      bool connectionStateVisible = false,
      List<Message> messages = const <Message>[]}) {
    return _ChatState(
      pageNumber: pageNumber,
      initialLoading: initialLoading,
      messagesLeft: messagesLeft,
      cable: cable,
      retryCount: retryCount,
      closedBy: closedBy,
      matchClosed: matchClosed,
      connection: connection,
      connectionStateVisible: connectionStateVisible,
      messages: messages,
    );
  }
}

/// @nodoc
const $ChatState = _$ChatStateTearOff();

/// @nodoc
mixin _$ChatState {
  int get pageNumber => throw _privateConstructorUsedError;
  bool get initialLoading => throw _privateConstructorUsedError;
  bool get messagesLeft => throw _privateConstructorUsedError;
  ActionCable? get cable => throw _privateConstructorUsedError;
  int get retryCount => throw _privateConstructorUsedError;
  int? get closedBy => throw _privateConstructorUsedError;
  bool get matchClosed => throw _privateConstructorUsedError;
  ChatConnectionState get connection => throw _privateConstructorUsedError;
  bool get connectionStateVisible => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call(
      {int pageNumber,
      bool initialLoading,
      bool messagesLeft,
      ActionCable? cable,
      int retryCount,
      int? closedBy,
      bool matchClosed,
      ChatConnectionState connection,
      bool connectionStateVisible,
      List<Message> messages});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;

  @override
  $Res call({
    Object? pageNumber = freezed,
    Object? initialLoading = freezed,
    Object? messagesLeft = freezed,
    Object? cable = freezed,
    Object? retryCount = freezed,
    Object? closedBy = freezed,
    Object? matchClosed = freezed,
    Object? connection = freezed,
    Object? connectionStateVisible = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      initialLoading: initialLoading == freezed
          ? _value.initialLoading
          : initialLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      messagesLeft: messagesLeft == freezed
          ? _value.messagesLeft
          : messagesLeft // ignore: cast_nullable_to_non_nullable
              as bool,
      cable: cable == freezed
          ? _value.cable
          : cable // ignore: cast_nullable_to_non_nullable
              as ActionCable?,
      retryCount: retryCount == freezed
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      closedBy: closedBy == freezed
          ? _value.closedBy
          : closedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      matchClosed: matchClosed == freezed
          ? _value.matchClosed
          : matchClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      connection: connection == freezed
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as ChatConnectionState,
      connectionStateVisible: connectionStateVisible == freezed
          ? _value.connectionStateVisible
          : connectionStateVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
abstract class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) then) =
      __$ChatStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int pageNumber,
      bool initialLoading,
      bool messagesLeft,
      ActionCable? cable,
      int retryCount,
      int? closedBy,
      bool matchClosed,
      ChatConnectionState connection,
      bool connectionStateVisible,
      List<Message> messages});
}

/// @nodoc
class __$ChatStateCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(_ChatState _value, $Res Function(_ChatState) _then)
      : super(_value, (v) => _then(v as _ChatState));

  @override
  _ChatState get _value => super._value as _ChatState;

  @override
  $Res call({
    Object? pageNumber = freezed,
    Object? initialLoading = freezed,
    Object? messagesLeft = freezed,
    Object? cable = freezed,
    Object? retryCount = freezed,
    Object? closedBy = freezed,
    Object? matchClosed = freezed,
    Object? connection = freezed,
    Object? connectionStateVisible = freezed,
    Object? messages = freezed,
  }) {
    return _then(_ChatState(
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      initialLoading: initialLoading == freezed
          ? _value.initialLoading
          : initialLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      messagesLeft: messagesLeft == freezed
          ? _value.messagesLeft
          : messagesLeft // ignore: cast_nullable_to_non_nullable
              as bool,
      cable: cable == freezed
          ? _value.cable
          : cable // ignore: cast_nullable_to_non_nullable
              as ActionCable?,
      retryCount: retryCount == freezed
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      closedBy: closedBy == freezed
          ? _value.closedBy
          : closedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      matchClosed: matchClosed == freezed
          ? _value.matchClosed
          : matchClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      connection: connection == freezed
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as ChatConnectionState,
      connectionStateVisible: connectionStateVisible == freezed
          ? _value.connectionStateVisible
          : connectionStateVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$_ChatState extends _ChatState {
  _$_ChatState(
      {this.pageNumber = 1,
      this.initialLoading = true,
      this.messagesLeft = true,
      this.cable,
      this.retryCount = 0,
      this.closedBy,
      this.matchClosed = false,
      this.connection = ChatConnectionState.connecting,
      this.connectionStateVisible = false,
      this.messages = const <Message>[]})
      : super._();

  @JsonKey()
  @override
  final int pageNumber;
  @JsonKey()
  @override
  final bool initialLoading;
  @JsonKey()
  @override
  final bool messagesLeft;
  @override
  final ActionCable? cable;
  @JsonKey()
  @override
  final int retryCount;
  @override
  final int? closedBy;
  @JsonKey()
  @override
  final bool matchClosed;
  @JsonKey()
  @override
  final ChatConnectionState connection;
  @JsonKey()
  @override
  final bool connectionStateVisible;
  @JsonKey()
  @override
  final List<Message> messages;

  @override
  String toString() {
    return 'ChatState(pageNumber: $pageNumber, initialLoading: $initialLoading, messagesLeft: $messagesLeft, cable: $cable, retryCount: $retryCount, closedBy: $closedBy, matchClosed: $matchClosed, connection: $connection, connectionStateVisible: $connectionStateVisible, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatState &&
            const DeepCollectionEquality()
                .equals(other.pageNumber, pageNumber) &&
            const DeepCollectionEquality()
                .equals(other.initialLoading, initialLoading) &&
            const DeepCollectionEquality()
                .equals(other.messagesLeft, messagesLeft) &&
            const DeepCollectionEquality().equals(other.cable, cable) &&
            const DeepCollectionEquality()
                .equals(other.retryCount, retryCount) &&
            const DeepCollectionEquality().equals(other.closedBy, closedBy) &&
            const DeepCollectionEquality()
                .equals(other.matchClosed, matchClosed) &&
            const DeepCollectionEquality()
                .equals(other.connection, connection) &&
            const DeepCollectionEquality()
                .equals(other.connectionStateVisible, connectionStateVisible) &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pageNumber),
      const DeepCollectionEquality().hash(initialLoading),
      const DeepCollectionEquality().hash(messagesLeft),
      const DeepCollectionEquality().hash(cable),
      const DeepCollectionEquality().hash(retryCount),
      const DeepCollectionEquality().hash(closedBy),
      const DeepCollectionEquality().hash(matchClosed),
      const DeepCollectionEquality().hash(connection),
      const DeepCollectionEquality().hash(connectionStateVisible),
      const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);
}

abstract class _ChatState extends ChatState {
  factory _ChatState(
      {int pageNumber,
      bool initialLoading,
      bool messagesLeft,
      ActionCable? cable,
      int retryCount,
      int? closedBy,
      bool matchClosed,
      ChatConnectionState connection,
      bool connectionStateVisible,
      List<Message> messages}) = _$_ChatState;
  _ChatState._() : super._();

  @override
  int get pageNumber;
  @override
  bool get initialLoading;
  @override
  bool get messagesLeft;
  @override
  ActionCable? get cable;
  @override
  int get retryCount;
  @override
  int? get closedBy;
  @override
  bool get matchClosed;
  @override
  ChatConnectionState get connection;
  @override
  bool get connectionStateVisible;
  @override
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
