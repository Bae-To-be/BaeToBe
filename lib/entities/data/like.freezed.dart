// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Like _$LikeFromJson(Map<String, dynamic> json) {
  return _Like.fromJson(json);
}

/// @nodoc
class _$LikeTearOff {
  const _$LikeTearOff();

  _Like call(
      {@JsonKey(name: '_id', readValue: Like._readId)
          required int id,
      @JsonKey(name: 'name', readValue: Like._readUser)
          required String userName,
      @JsonKey(name: 'id', readValue: Like._readUser)
          required int userId,
      @JsonKey(name: 'summary', readValue: Like._readUser)
          required String summary,
      @JsonKey(name: 'time_since_creation')
          required String timeSinceCreation,
      @JsonKey(name: 'profile_picture', readValue: Like._readUser)
          UserImage? profilePicture}) {
    return _Like(
      id: id,
      userName: userName,
      userId: userId,
      summary: summary,
      timeSinceCreation: timeSinceCreation,
      profilePicture: profilePicture,
    );
  }

  Like fromJson(Map<String, Object?> json) {
    return Like.fromJson(json);
  }
}

/// @nodoc
const $Like = _$LikeTearOff();

/// @nodoc
mixin _$Like {
  @JsonKey(name: '_id', readValue: Like._readId)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', readValue: Like._readUser)
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'id', readValue: Like._readUser)
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary', readValue: Like._readUser)
  String get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_since_creation')
  String get timeSinceCreation => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_picture', readValue: Like._readUser)
  UserImage? get profilePicture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikeCopyWith<Like> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeCopyWith<$Res> {
  factory $LikeCopyWith(Like value, $Res Function(Like) then) =
      _$LikeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id', readValue: Like._readId)
          int id,
      @JsonKey(name: 'name', readValue: Like._readUser)
          String userName,
      @JsonKey(name: 'id', readValue: Like._readUser)
          int userId,
      @JsonKey(name: 'summary', readValue: Like._readUser)
          String summary,
      @JsonKey(name: 'time_since_creation')
          String timeSinceCreation,
      @JsonKey(name: 'profile_picture', readValue: Like._readUser)
          UserImage? profilePicture});

  $UserImageCopyWith<$Res>? get profilePicture;
}

/// @nodoc
class _$LikeCopyWithImpl<$Res> implements $LikeCopyWith<$Res> {
  _$LikeCopyWithImpl(this._value, this._then);

  final Like _value;
  // ignore: unused_field
  final $Res Function(Like) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? userId = freezed,
    Object? summary = freezed,
    Object? timeSinceCreation = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      timeSinceCreation: timeSinceCreation == freezed
          ? _value.timeSinceCreation
          : timeSinceCreation // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as UserImage?,
    ));
  }

  @override
  $UserImageCopyWith<$Res>? get profilePicture {
    if (_value.profilePicture == null) {
      return null;
    }

    return $UserImageCopyWith<$Res>(_value.profilePicture!, (value) {
      return _then(_value.copyWith(profilePicture: value));
    });
  }
}

/// @nodoc
abstract class _$LikeCopyWith<$Res> implements $LikeCopyWith<$Res> {
  factory _$LikeCopyWith(_Like value, $Res Function(_Like) then) =
      __$LikeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id', readValue: Like._readId)
          int id,
      @JsonKey(name: 'name', readValue: Like._readUser)
          String userName,
      @JsonKey(name: 'id', readValue: Like._readUser)
          int userId,
      @JsonKey(name: 'summary', readValue: Like._readUser)
          String summary,
      @JsonKey(name: 'time_since_creation')
          String timeSinceCreation,
      @JsonKey(name: 'profile_picture', readValue: Like._readUser)
          UserImage? profilePicture});

  @override
  $UserImageCopyWith<$Res>? get profilePicture;
}

/// @nodoc
class __$LikeCopyWithImpl<$Res> extends _$LikeCopyWithImpl<$Res>
    implements _$LikeCopyWith<$Res> {
  __$LikeCopyWithImpl(_Like _value, $Res Function(_Like) _then)
      : super(_value, (v) => _then(v as _Like));

  @override
  _Like get _value => super._value as _Like;

  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? userId = freezed,
    Object? summary = freezed,
    Object? timeSinceCreation = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_Like(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      timeSinceCreation: timeSinceCreation == freezed
          ? _value.timeSinceCreation
          : timeSinceCreation // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as UserImage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Like implements _Like {
  _$_Like(
      {@JsonKey(name: '_id', readValue: Like._readId)
          required this.id,
      @JsonKey(name: 'name', readValue: Like._readUser)
          required this.userName,
      @JsonKey(name: 'id', readValue: Like._readUser)
          required this.userId,
      @JsonKey(name: 'summary', readValue: Like._readUser)
          required this.summary,
      @JsonKey(name: 'time_since_creation')
          required this.timeSinceCreation,
      @JsonKey(name: 'profile_picture', readValue: Like._readUser)
          this.profilePicture});

  factory _$_Like.fromJson(Map<String, dynamic> json) => _$$_LikeFromJson(json);

  @override
  @JsonKey(name: '_id', readValue: Like._readId)
  final int id;
  @override
  @JsonKey(name: 'name', readValue: Like._readUser)
  final String userName;
  @override
  @JsonKey(name: 'id', readValue: Like._readUser)
  final int userId;
  @override
  @JsonKey(name: 'summary', readValue: Like._readUser)
  final String summary;
  @override
  @JsonKey(name: 'time_since_creation')
  final String timeSinceCreation;
  @override
  @JsonKey(name: 'profile_picture', readValue: Like._readUser)
  final UserImage? profilePicture;

  @override
  String toString() {
    return 'Like(id: $id, userName: $userName, userId: $userId, summary: $summary, timeSinceCreation: $timeSinceCreation, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Like &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.summary, summary) &&
            const DeepCollectionEquality()
                .equals(other.timeSinceCreation, timeSinceCreation) &&
            const DeepCollectionEquality()
                .equals(other.profilePicture, profilePicture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(summary),
      const DeepCollectionEquality().hash(timeSinceCreation),
      const DeepCollectionEquality().hash(profilePicture));

  @JsonKey(ignore: true)
  @override
  _$LikeCopyWith<_Like> get copyWith =>
      __$LikeCopyWithImpl<_Like>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikeToJson(this);
  }
}

abstract class _Like implements Like {
  factory _Like(
      {@JsonKey(name: '_id', readValue: Like._readId)
          required int id,
      @JsonKey(name: 'name', readValue: Like._readUser)
          required String userName,
      @JsonKey(name: 'id', readValue: Like._readUser)
          required int userId,
      @JsonKey(name: 'summary', readValue: Like._readUser)
          required String summary,
      @JsonKey(name: 'time_since_creation')
          required String timeSinceCreation,
      @JsonKey(name: 'profile_picture', readValue: Like._readUser)
          UserImage? profilePicture}) = _$_Like;

  factory _Like.fromJson(Map<String, dynamic> json) = _$_Like.fromJson;

  @override
  @JsonKey(name: '_id', readValue: Like._readId)
  int get id;
  @override
  @JsonKey(name: 'name', readValue: Like._readUser)
  String get userName;
  @override
  @JsonKey(name: 'id', readValue: Like._readUser)
  int get userId;
  @override
  @JsonKey(name: 'summary', readValue: Like._readUser)
  String get summary;
  @override
  @JsonKey(name: 'time_since_creation')
  String get timeSinceCreation;
  @override
  @JsonKey(name: 'profile_picture', readValue: Like._readUser)
  UserImage? get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$LikeCopyWith<_Like> get copyWith => throw _privateConstructorUsedError;
}
