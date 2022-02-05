// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthInformation _$AuthInformationFromJson(Map<String, dynamic> json) {
  return _AuthInformation.fromJson(json);
}

/// @nodoc
class _$AuthInformationTearOff {
  const _$AuthInformationTearOff();

  _AuthInformation call(
      {@JsonKey(defaultValue: 'access_token') required String accessToken,
      @JsonKey(defaultValue: 'refresh_token') required String refreshToken,
      @JsonKey(defaultValue: 'expires_in') required int expiresIn,
      @JsonKey(defaultValue: 'fetched_at') required DateTime fetchedAt}) {
    return _AuthInformation(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresIn: expiresIn,
      fetchedAt: fetchedAt,
    );
  }

  AuthInformation fromJson(Map<String, Object?> json) {
    return AuthInformation.fromJson(json);
  }
}

/// @nodoc
const $AuthInformation = _$AuthInformationTearOff();

/// @nodoc
mixin _$AuthInformation {
  @JsonKey(defaultValue: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'expires_in')
  int get expiresIn => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'fetched_at')
  DateTime get fetchedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthInformationCopyWith<AuthInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthInformationCopyWith<$Res> {
  factory $AuthInformationCopyWith(
          AuthInformation value, $Res Function(AuthInformation) then) =
      _$AuthInformationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(defaultValue: 'access_token') String accessToken,
      @JsonKey(defaultValue: 'refresh_token') String refreshToken,
      @JsonKey(defaultValue: 'expires_in') int expiresIn,
      @JsonKey(defaultValue: 'fetched_at') DateTime fetchedAt});
}

/// @nodoc
class _$AuthInformationCopyWithImpl<$Res>
    implements $AuthInformationCopyWith<$Res> {
  _$AuthInformationCopyWithImpl(this._value, this._then);

  final AuthInformation _value;
  // ignore: unused_field
  final $Res Function(AuthInformation) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? expiresIn = freezed,
    Object? fetchedAt = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      fetchedAt: fetchedAt == freezed
          ? _value.fetchedAt
          : fetchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$AuthInformationCopyWith<$Res>
    implements $AuthInformationCopyWith<$Res> {
  factory _$AuthInformationCopyWith(
          _AuthInformation value, $Res Function(_AuthInformation) then) =
      __$AuthInformationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(defaultValue: 'access_token') String accessToken,
      @JsonKey(defaultValue: 'refresh_token') String refreshToken,
      @JsonKey(defaultValue: 'expires_in') int expiresIn,
      @JsonKey(defaultValue: 'fetched_at') DateTime fetchedAt});
}

/// @nodoc
class __$AuthInformationCopyWithImpl<$Res>
    extends _$AuthInformationCopyWithImpl<$Res>
    implements _$AuthInformationCopyWith<$Res> {
  __$AuthInformationCopyWithImpl(
      _AuthInformation _value, $Res Function(_AuthInformation) _then)
      : super(_value, (v) => _then(v as _AuthInformation));

  @override
  _AuthInformation get _value => super._value as _AuthInformation;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? expiresIn = freezed,
    Object? fetchedAt = freezed,
  }) {
    return _then(_AuthInformation(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      fetchedAt: fetchedAt == freezed
          ? _value.fetchedAt
          : fetchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthInformation extends _AuthInformation {
  _$_AuthInformation(
      {@JsonKey(defaultValue: 'access_token') required this.accessToken,
      @JsonKey(defaultValue: 'refresh_token') required this.refreshToken,
      @JsonKey(defaultValue: 'expires_in') required this.expiresIn,
      @JsonKey(defaultValue: 'fetched_at') required this.fetchedAt})
      : super._();

  factory _$_AuthInformation.fromJson(Map<String, dynamic> json) =>
      _$$_AuthInformationFromJson(json);

  @override
  @JsonKey(defaultValue: 'access_token')
  final String accessToken;
  @override
  @JsonKey(defaultValue: 'refresh_token')
  final String refreshToken;
  @override
  @JsonKey(defaultValue: 'expires_in')
  final int expiresIn;
  @override
  @JsonKey(defaultValue: 'fetched_at')
  final DateTime fetchedAt;

  @override
  String toString() {
    return 'AuthInformation(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, fetchedAt: $fetchedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthInformation &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken) &&
            const DeepCollectionEquality().equals(other.expiresIn, expiresIn) &&
            const DeepCollectionEquality().equals(other.fetchedAt, fetchedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(refreshToken),
      const DeepCollectionEquality().hash(expiresIn),
      const DeepCollectionEquality().hash(fetchedAt));

  @JsonKey(ignore: true)
  @override
  _$AuthInformationCopyWith<_AuthInformation> get copyWith =>
      __$AuthInformationCopyWithImpl<_AuthInformation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthInformationToJson(this);
  }
}

abstract class _AuthInformation extends AuthInformation {
  factory _AuthInformation(
          {@JsonKey(defaultValue: 'access_token') required String accessToken,
          @JsonKey(defaultValue: 'refresh_token') required String refreshToken,
          @JsonKey(defaultValue: 'expires_in') required int expiresIn,
          @JsonKey(defaultValue: 'fetched_at') required DateTime fetchedAt}) =
      _$_AuthInformation;
  _AuthInformation._() : super._();

  factory _AuthInformation.fromJson(Map<String, dynamic> json) =
      _$_AuthInformation.fromJson;

  @override
  @JsonKey(defaultValue: 'access_token')
  String get accessToken;
  @override
  @JsonKey(defaultValue: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(defaultValue: 'expires_in')
  int get expiresIn;
  @override
  @JsonKey(defaultValue: 'fetched_at')
  DateTime get fetchedAt;
  @override
  @JsonKey(ignore: true)
  _$AuthInformationCopyWith<_AuthInformation> get copyWith =>
      throw _privateConstructorUsedError;
}
