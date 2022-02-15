// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Match _$MatchFromJson(Map<String, dynamic> json) {
  return _Match.fromJson(json);
}

/// @nodoc
class _$MatchTearOff {
  const _$MatchTearOff();

  _Match call(
      {@JsonKey(name: '_id', readValue: Readers.readId)
          required int id,
      @JsonKey(name: 'matched_user')
          required BasicProfile basicProfile,
      @JsonKey(name: 'closed_by')
          int? closedBy,
      @JsonKey(name: 'is_closed')
          required bool isClosed,
      @JsonKey(name: 'time_since_update')
          required String timeSinceUpdate,
      @JsonKey(name: 'unread_count')
          int unreadCount = 0,
      @JsonKey(name: 'updated_at', readValue: Readers.parseInt)
          required int updatedAt}) {
    return _Match(
      id: id,
      basicProfile: basicProfile,
      closedBy: closedBy,
      isClosed: isClosed,
      timeSinceUpdate: timeSinceUpdate,
      unreadCount: unreadCount,
      updatedAt: updatedAt,
    );
  }

  Match fromJson(Map<String, Object?> json) {
    return Match.fromJson(json);
  }
}

/// @nodoc
const $Match = _$MatchTearOff();

/// @nodoc
mixin _$Match {
  @JsonKey(name: '_id', readValue: Readers.readId)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'matched_user')
  BasicProfile get basicProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'closed_by')
  int? get closedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_closed')
  bool get isClosed => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_since_update')
  String get timeSinceUpdate => throw _privateConstructorUsedError;
  @JsonKey(name: 'unread_count')
  int get unreadCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', readValue: Readers.parseInt)
  int get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchCopyWith<Match> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCopyWith<$Res> {
  factory $MatchCopyWith(Match value, $Res Function(Match) then) =
      _$MatchCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id', readValue: Readers.readId) int id,
      @JsonKey(name: 'matched_user') BasicProfile basicProfile,
      @JsonKey(name: 'closed_by') int? closedBy,
      @JsonKey(name: 'is_closed') bool isClosed,
      @JsonKey(name: 'time_since_update') String timeSinceUpdate,
      @JsonKey(name: 'unread_count') int unreadCount,
      @JsonKey(name: 'updated_at', readValue: Readers.parseInt) int updatedAt});

  $BasicProfileCopyWith<$Res> get basicProfile;
}

/// @nodoc
class _$MatchCopyWithImpl<$Res> implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._value, this._then);

  final Match _value;
  // ignore: unused_field
  final $Res Function(Match) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? basicProfile = freezed,
    Object? closedBy = freezed,
    Object? isClosed = freezed,
    Object? timeSinceUpdate = freezed,
    Object? unreadCount = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      basicProfile: basicProfile == freezed
          ? _value.basicProfile
          : basicProfile // ignore: cast_nullable_to_non_nullable
              as BasicProfile,
      closedBy: closedBy == freezed
          ? _value.closedBy
          : closedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      isClosed: isClosed == freezed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      timeSinceUpdate: timeSinceUpdate == freezed
          ? _value.timeSinceUpdate
          : timeSinceUpdate // ignore: cast_nullable_to_non_nullable
              as String,
      unreadCount: unreadCount == freezed
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $BasicProfileCopyWith<$Res> get basicProfile {
    return $BasicProfileCopyWith<$Res>(_value.basicProfile, (value) {
      return _then(_value.copyWith(basicProfile: value));
    });
  }
}

/// @nodoc
abstract class _$MatchCopyWith<$Res> implements $MatchCopyWith<$Res> {
  factory _$MatchCopyWith(_Match value, $Res Function(_Match) then) =
      __$MatchCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id', readValue: Readers.readId) int id,
      @JsonKey(name: 'matched_user') BasicProfile basicProfile,
      @JsonKey(name: 'closed_by') int? closedBy,
      @JsonKey(name: 'is_closed') bool isClosed,
      @JsonKey(name: 'time_since_update') String timeSinceUpdate,
      @JsonKey(name: 'unread_count') int unreadCount,
      @JsonKey(name: 'updated_at', readValue: Readers.parseInt) int updatedAt});

  @override
  $BasicProfileCopyWith<$Res> get basicProfile;
}

/// @nodoc
class __$MatchCopyWithImpl<$Res> extends _$MatchCopyWithImpl<$Res>
    implements _$MatchCopyWith<$Res> {
  __$MatchCopyWithImpl(_Match _value, $Res Function(_Match) _then)
      : super(_value, (v) => _then(v as _Match));

  @override
  _Match get _value => super._value as _Match;

  @override
  $Res call({
    Object? id = freezed,
    Object? basicProfile = freezed,
    Object? closedBy = freezed,
    Object? isClosed = freezed,
    Object? timeSinceUpdate = freezed,
    Object? unreadCount = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Match(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      basicProfile: basicProfile == freezed
          ? _value.basicProfile
          : basicProfile // ignore: cast_nullable_to_non_nullable
              as BasicProfile,
      closedBy: closedBy == freezed
          ? _value.closedBy
          : closedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      isClosed: isClosed == freezed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      timeSinceUpdate: timeSinceUpdate == freezed
          ? _value.timeSinceUpdate
          : timeSinceUpdate // ignore: cast_nullable_to_non_nullable
              as String,
      unreadCount: unreadCount == freezed
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Match extends _Match {
  _$_Match(
      {@JsonKey(name: '_id', readValue: Readers.readId)
          required this.id,
      @JsonKey(name: 'matched_user')
          required this.basicProfile,
      @JsonKey(name: 'closed_by')
          this.closedBy,
      @JsonKey(name: 'is_closed')
          required this.isClosed,
      @JsonKey(name: 'time_since_update')
          required this.timeSinceUpdate,
      @JsonKey(name: 'unread_count')
          this.unreadCount = 0,
      @JsonKey(name: 'updated_at', readValue: Readers.parseInt)
          required this.updatedAt})
      : super._();

  factory _$_Match.fromJson(Map<String, dynamic> json) =>
      _$$_MatchFromJson(json);

  @override
  @JsonKey(name: '_id', readValue: Readers.readId)
  final int id;
  @override
  @JsonKey(name: 'matched_user')
  final BasicProfile basicProfile;
  @override
  @JsonKey(name: 'closed_by')
  final int? closedBy;
  @override
  @JsonKey(name: 'is_closed')
  final bool isClosed;
  @override
  @JsonKey(name: 'time_since_update')
  final String timeSinceUpdate;
  @override
  @JsonKey(name: 'unread_count')
  final int unreadCount;
  @override
  @JsonKey(name: 'updated_at', readValue: Readers.parseInt)
  final int updatedAt;

  @override
  String toString() {
    return 'Match(id: $id, basicProfile: $basicProfile, closedBy: $closedBy, isClosed: $isClosed, timeSinceUpdate: $timeSinceUpdate, unreadCount: $unreadCount, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Match &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.basicProfile, basicProfile) &&
            const DeepCollectionEquality().equals(other.closedBy, closedBy) &&
            const DeepCollectionEquality().equals(other.isClosed, isClosed) &&
            const DeepCollectionEquality()
                .equals(other.timeSinceUpdate, timeSinceUpdate) &&
            const DeepCollectionEquality()
                .equals(other.unreadCount, unreadCount) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(basicProfile),
      const DeepCollectionEquality().hash(closedBy),
      const DeepCollectionEquality().hash(isClosed),
      const DeepCollectionEquality().hash(timeSinceUpdate),
      const DeepCollectionEquality().hash(unreadCount),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$MatchCopyWith<_Match> get copyWith =>
      __$MatchCopyWithImpl<_Match>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchToJson(this);
  }
}

abstract class _Match extends Match {
  factory _Match(
      {@JsonKey(name: '_id', readValue: Readers.readId)
          required int id,
      @JsonKey(name: 'matched_user')
          required BasicProfile basicProfile,
      @JsonKey(name: 'closed_by')
          int? closedBy,
      @JsonKey(name: 'is_closed')
          required bool isClosed,
      @JsonKey(name: 'time_since_update')
          required String timeSinceUpdate,
      @JsonKey(name: 'unread_count')
          int unreadCount,
      @JsonKey(name: 'updated_at', readValue: Readers.parseInt)
          required int updatedAt}) = _$_Match;
  _Match._() : super._();

  factory _Match.fromJson(Map<String, dynamic> json) = _$_Match.fromJson;

  @override
  @JsonKey(name: '_id', readValue: Readers.readId)
  int get id;
  @override
  @JsonKey(name: 'matched_user')
  BasicProfile get basicProfile;
  @override
  @JsonKey(name: 'closed_by')
  int? get closedBy;
  @override
  @JsonKey(name: 'is_closed')
  bool get isClosed;
  @override
  @JsonKey(name: 'time_since_update')
  String get timeSinceUpdate;
  @override
  @JsonKey(name: 'unread_count')
  int get unreadCount;
  @override
  @JsonKey(name: 'updated_at', readValue: Readers.parseInt)
  int get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$MatchCopyWith<_Match> get copyWith => throw _privateConstructorUsedError;
}
