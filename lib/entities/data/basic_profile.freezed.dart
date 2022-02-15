// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'basic_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BasicProfile _$BasicProfileFromJson(Map<String, dynamic> json) {
  return _BasicProfile.fromJson(json);
}

/// @nodoc
class _$BasicProfileTearOff {
  const _$BasicProfileTearOff();

  _BasicProfile call(
      {@JsonKey(name: 'name') required String userName,
      required int age,
      @JsonKey(name: 'id') required int userId,
      @JsonKey(name: 'profile_picture') UserImage? profilePicture}) {
    return _BasicProfile(
      userName: userName,
      age: age,
      userId: userId,
      profilePicture: profilePicture,
    );
  }

  BasicProfile fromJson(Map<String, Object?> json) {
    return BasicProfile.fromJson(json);
  }
}

/// @nodoc
const $BasicProfile = _$BasicProfileTearOff();

/// @nodoc
mixin _$BasicProfile {
  @JsonKey(name: 'name')
  String get userName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_picture')
  UserImage? get profilePicture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicProfileCopyWith<BasicProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicProfileCopyWith<$Res> {
  factory $BasicProfileCopyWith(
          BasicProfile value, $Res Function(BasicProfile) then) =
      _$BasicProfileCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'name') String userName,
      int age,
      @JsonKey(name: 'id') int userId,
      @JsonKey(name: 'profile_picture') UserImage? profilePicture});

  $UserImageCopyWith<$Res>? get profilePicture;
}

/// @nodoc
class _$BasicProfileCopyWithImpl<$Res> implements $BasicProfileCopyWith<$Res> {
  _$BasicProfileCopyWithImpl(this._value, this._then);

  final BasicProfile _value;
  // ignore: unused_field
  final $Res Function(BasicProfile) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? age = freezed,
    Object? userId = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$BasicProfileCopyWith<$Res>
    implements $BasicProfileCopyWith<$Res> {
  factory _$BasicProfileCopyWith(
          _BasicProfile value, $Res Function(_BasicProfile) then) =
      __$BasicProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'name') String userName,
      int age,
      @JsonKey(name: 'id') int userId,
      @JsonKey(name: 'profile_picture') UserImage? profilePicture});

  @override
  $UserImageCopyWith<$Res>? get profilePicture;
}

/// @nodoc
class __$BasicProfileCopyWithImpl<$Res> extends _$BasicProfileCopyWithImpl<$Res>
    implements _$BasicProfileCopyWith<$Res> {
  __$BasicProfileCopyWithImpl(
      _BasicProfile _value, $Res Function(_BasicProfile) _then)
      : super(_value, (v) => _then(v as _BasicProfile));

  @override
  _BasicProfile get _value => super._value as _BasicProfile;

  @override
  $Res call({
    Object? userName = freezed,
    Object? age = freezed,
    Object? userId = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_BasicProfile(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as UserImage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicProfile implements _BasicProfile {
  _$_BasicProfile(
      {@JsonKey(name: 'name') required this.userName,
      required this.age,
      @JsonKey(name: 'id') required this.userId,
      @JsonKey(name: 'profile_picture') this.profilePicture});

  factory _$_BasicProfile.fromJson(Map<String, dynamic> json) =>
      _$$_BasicProfileFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String userName;
  @override
  final int age;
  @override
  @JsonKey(name: 'id')
  final int userId;
  @override
  @JsonKey(name: 'profile_picture')
  final UserImage? profilePicture;

  @override
  String toString() {
    return 'BasicProfile(userName: $userName, age: $age, userId: $userId, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BasicProfile &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.profilePicture, profilePicture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(profilePicture));

  @JsonKey(ignore: true)
  @override
  _$BasicProfileCopyWith<_BasicProfile> get copyWith =>
      __$BasicProfileCopyWithImpl<_BasicProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicProfileToJson(this);
  }
}

abstract class _BasicProfile implements BasicProfile {
  factory _BasicProfile(
          {@JsonKey(name: 'name') required String userName,
          required int age,
          @JsonKey(name: 'id') required int userId,
          @JsonKey(name: 'profile_picture') UserImage? profilePicture}) =
      _$_BasicProfile;

  factory _BasicProfile.fromJson(Map<String, dynamic> json) =
      _$_BasicProfile.fromJson;

  @override
  @JsonKey(name: 'name')
  String get userName;
  @override
  int get age;
  @override
  @JsonKey(name: 'id')
  int get userId;
  @override
  @JsonKey(name: 'profile_picture')
  UserImage? get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$BasicProfileCopyWith<_BasicProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
