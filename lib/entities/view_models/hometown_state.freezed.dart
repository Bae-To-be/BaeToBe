// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hometown_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HometownStateTearOff {
  const _$HometownStateTearOff();

  _HometownState call({String? countryName, String? cityName}) {
    return _HometownState(
      countryName: countryName,
      cityName: cityName,
    );
  }
}

/// @nodoc
const $HometownState = _$HometownStateTearOff();

/// @nodoc
mixin _$HometownState {
  String? get countryName => throw _privateConstructorUsedError;
  String? get cityName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HometownStateCopyWith<HometownState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HometownStateCopyWith<$Res> {
  factory $HometownStateCopyWith(
          HometownState value, $Res Function(HometownState) then) =
      _$HometownStateCopyWithImpl<$Res>;
  $Res call({String? countryName, String? cityName});
}

/// @nodoc
class _$HometownStateCopyWithImpl<$Res>
    implements $HometownStateCopyWith<$Res> {
  _$HometownStateCopyWithImpl(this._value, this._then);

  final HometownState _value;
  // ignore: unused_field
  final $Res Function(HometownState) _then;

  @override
  $Res call({
    Object? countryName = freezed,
    Object? cityName = freezed,
  }) {
    return _then(_value.copyWith(
      countryName: countryName == freezed
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      cityName: cityName == freezed
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$HometownStateCopyWith<$Res>
    implements $HometownStateCopyWith<$Res> {
  factory _$HometownStateCopyWith(
          _HometownState value, $Res Function(_HometownState) then) =
      __$HometownStateCopyWithImpl<$Res>;
  @override
  $Res call({String? countryName, String? cityName});
}

/// @nodoc
class __$HometownStateCopyWithImpl<$Res>
    extends _$HometownStateCopyWithImpl<$Res>
    implements _$HometownStateCopyWith<$Res> {
  __$HometownStateCopyWithImpl(
      _HometownState _value, $Res Function(_HometownState) _then)
      : super(_value, (v) => _then(v as _HometownState));

  @override
  _HometownState get _value => super._value as _HometownState;

  @override
  $Res call({
    Object? countryName = freezed,
    Object? cityName = freezed,
  }) {
    return _then(_HometownState(
      countryName: countryName == freezed
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      cityName: cityName == freezed
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_HometownState implements _HometownState {
  _$_HometownState({this.countryName, this.cityName});

  @override
  final String? countryName;
  @override
  final String? cityName;

  @override
  String toString() {
    return 'HometownState(countryName: $countryName, cityName: $cityName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HometownState &&
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
  _$HometownStateCopyWith<_HometownState> get copyWith =>
      __$HometownStateCopyWithImpl<_HometownState>(this, _$identity);
}

abstract class _HometownState implements HometownState {
  factory _HometownState({String? countryName, String? cityName}) =
      _$_HometownState;

  @override
  String? get countryName;
  @override
  String? get cityName;
  @override
  @JsonKey(ignore: true)
  _$HometownStateCopyWith<_HometownState> get copyWith =>
      throw _privateConstructorUsedError;
}
