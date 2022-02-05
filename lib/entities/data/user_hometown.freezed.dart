// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_hometown.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserHometown _$UserHometownFromJson(Map<String, dynamic> json) {
  return _UserHometown.fromJson(json);
}

/// @nodoc
class _$UserHometownTearOff {
  const _$UserHometownTearOff();

  _UserHometown call(
      {@JsonKey(name: 'country_name') String countryName = '',
      @_CityNameConverter() @JsonKey(name: 'city') String cityName = ''}) {
    return _UserHometown(
      countryName: countryName,
      cityName: cityName,
    );
  }

  UserHometown fromJson(Map<String, Object?> json) {
    return UserHometown.fromJson(json);
  }
}

/// @nodoc
const $UserHometown = _$UserHometownTearOff();

/// @nodoc
mixin _$UserHometown {
  @JsonKey(name: 'country_name')
  String get countryName => throw _privateConstructorUsedError;
  @_CityNameConverter()
  @JsonKey(name: 'city')
  String get cityName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserHometownCopyWith<UserHometown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserHometownCopyWith<$Res> {
  factory $UserHometownCopyWith(
          UserHometown value, $Res Function(UserHometown) then) =
      _$UserHometownCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'country_name') String countryName,
      @_CityNameConverter() @JsonKey(name: 'city') String cityName});
}

/// @nodoc
class _$UserHometownCopyWithImpl<$Res> implements $UserHometownCopyWith<$Res> {
  _$UserHometownCopyWithImpl(this._value, this._then);

  final UserHometown _value;
  // ignore: unused_field
  final $Res Function(UserHometown) _then;

  @override
  $Res call({
    Object? countryName = freezed,
    Object? cityName = freezed,
  }) {
    return _then(_value.copyWith(
      countryName: countryName == freezed
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: cityName == freezed
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserHometownCopyWith<$Res>
    implements $UserHometownCopyWith<$Res> {
  factory _$UserHometownCopyWith(
          _UserHometown value, $Res Function(_UserHometown) then) =
      __$UserHometownCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'country_name') String countryName,
      @_CityNameConverter() @JsonKey(name: 'city') String cityName});
}

/// @nodoc
class __$UserHometownCopyWithImpl<$Res> extends _$UserHometownCopyWithImpl<$Res>
    implements _$UserHometownCopyWith<$Res> {
  __$UserHometownCopyWithImpl(
      _UserHometown _value, $Res Function(_UserHometown) _then)
      : super(_value, (v) => _then(v as _UserHometown));

  @override
  _UserHometown get _value => super._value as _UserHometown;

  @override
  $Res call({
    Object? countryName = freezed,
    Object? cityName = freezed,
  }) {
    return _then(_UserHometown(
      countryName: countryName == freezed
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: cityName == freezed
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserHometown extends _UserHometown {
  _$_UserHometown(
      {@JsonKey(name: 'country_name') this.countryName = '',
      @_CityNameConverter() @JsonKey(name: 'city') this.cityName = ''})
      : super._();

  factory _$_UserHometown.fromJson(Map<String, dynamic> json) =>
      _$$_UserHometownFromJson(json);

  @override
  @JsonKey(name: 'country_name')
  final String countryName;
  @override
  @_CityNameConverter()
  @JsonKey(name: 'city')
  final String cityName;

  @override
  String toString() {
    return 'UserHometown(countryName: $countryName, cityName: $cityName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserHometown &&
            const DeepCollectionEquality()
                .equals(other.countryName, countryName) &&
            const DeepCollectionEquality().equals(other.cityName, cityName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(countryName),
      const DeepCollectionEquality().hash(cityName));

  @JsonKey(ignore: true)
  @override
  _$UserHometownCopyWith<_UserHometown> get copyWith =>
      __$UserHometownCopyWithImpl<_UserHometown>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserHometownToJson(this);
  }
}

abstract class _UserHometown extends UserHometown {
  factory _UserHometown(
          {@JsonKey(name: 'country_name') String countryName,
          @_CityNameConverter() @JsonKey(name: 'city') String cityName}) =
      _$_UserHometown;
  _UserHometown._() : super._();

  factory _UserHometown.fromJson(Map<String, dynamic> json) =
      _$_UserHometown.fromJson;

  @override
  @JsonKey(name: 'country_name')
  String get countryName;
  @override
  @_CityNameConverter()
  @JsonKey(name: 'city')
  String get cityName;
  @override
  @JsonKey(ignore: true)
  _$UserHometownCopyWith<_UserHometown> get copyWith =>
      throw _privateConstructorUsedError;
}
