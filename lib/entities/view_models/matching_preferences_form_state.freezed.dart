// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'matching_preferences_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MatchingPreferencesFormStateTearOff {
  const _$MatchingPreferencesFormStateTearOff();

  _MatchingPreferencesFormState call(
      {int searchRadius = 0,
      int interestedInAgeUpper = 0,
      int interestedInAgeLower = 0}) {
    return _MatchingPreferencesFormState(
      searchRadius: searchRadius,
      interestedInAgeUpper: interestedInAgeUpper,
      interestedInAgeLower: interestedInAgeLower,
    );
  }
}

/// @nodoc
const $MatchingPreferencesFormState = _$MatchingPreferencesFormStateTearOff();

/// @nodoc
mixin _$MatchingPreferencesFormState {
  int get searchRadius => throw _privateConstructorUsedError;
  int get interestedInAgeUpper => throw _privateConstructorUsedError;
  int get interestedInAgeLower => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchingPreferencesFormStateCopyWith<MatchingPreferencesFormState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingPreferencesFormStateCopyWith<$Res> {
  factory $MatchingPreferencesFormStateCopyWith(
          MatchingPreferencesFormState value,
          $Res Function(MatchingPreferencesFormState) then) =
      _$MatchingPreferencesFormStateCopyWithImpl<$Res>;
  $Res call(
      {int searchRadius, int interestedInAgeUpper, int interestedInAgeLower});
}

/// @nodoc
class _$MatchingPreferencesFormStateCopyWithImpl<$Res>
    implements $MatchingPreferencesFormStateCopyWith<$Res> {
  _$MatchingPreferencesFormStateCopyWithImpl(this._value, this._then);

  final MatchingPreferencesFormState _value;
  // ignore: unused_field
  final $Res Function(MatchingPreferencesFormState) _then;

  @override
  $Res call({
    Object? searchRadius = freezed,
    Object? interestedInAgeUpper = freezed,
    Object? interestedInAgeLower = freezed,
  }) {
    return _then(_value.copyWith(
      searchRadius: searchRadius == freezed
          ? _value.searchRadius
          : searchRadius // ignore: cast_nullable_to_non_nullable
              as int,
      interestedInAgeUpper: interestedInAgeUpper == freezed
          ? _value.interestedInAgeUpper
          : interestedInAgeUpper // ignore: cast_nullable_to_non_nullable
              as int,
      interestedInAgeLower: interestedInAgeLower == freezed
          ? _value.interestedInAgeLower
          : interestedInAgeLower // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MatchingPreferencesFormStateCopyWith<$Res>
    implements $MatchingPreferencesFormStateCopyWith<$Res> {
  factory _$MatchingPreferencesFormStateCopyWith(
          _MatchingPreferencesFormState value,
          $Res Function(_MatchingPreferencesFormState) then) =
      __$MatchingPreferencesFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int searchRadius, int interestedInAgeUpper, int interestedInAgeLower});
}

/// @nodoc
class __$MatchingPreferencesFormStateCopyWithImpl<$Res>
    extends _$MatchingPreferencesFormStateCopyWithImpl<$Res>
    implements _$MatchingPreferencesFormStateCopyWith<$Res> {
  __$MatchingPreferencesFormStateCopyWithImpl(
      _MatchingPreferencesFormState _value,
      $Res Function(_MatchingPreferencesFormState) _then)
      : super(_value, (v) => _then(v as _MatchingPreferencesFormState));

  @override
  _MatchingPreferencesFormState get _value =>
      super._value as _MatchingPreferencesFormState;

  @override
  $Res call({
    Object? searchRadius = freezed,
    Object? interestedInAgeUpper = freezed,
    Object? interestedInAgeLower = freezed,
  }) {
    return _then(_MatchingPreferencesFormState(
      searchRadius: searchRadius == freezed
          ? _value.searchRadius
          : searchRadius // ignore: cast_nullable_to_non_nullable
              as int,
      interestedInAgeUpper: interestedInAgeUpper == freezed
          ? _value.interestedInAgeUpper
          : interestedInAgeUpper // ignore: cast_nullable_to_non_nullable
              as int,
      interestedInAgeLower: interestedInAgeLower == freezed
          ? _value.interestedInAgeLower
          : interestedInAgeLower // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MatchingPreferencesFormState extends _MatchingPreferencesFormState {
  _$_MatchingPreferencesFormState(
      {this.searchRadius = 0,
      this.interestedInAgeUpper = 0,
      this.interestedInAgeLower = 0})
      : super._();

  @JsonKey()
  @override
  final int searchRadius;
  @JsonKey()
  @override
  final int interestedInAgeUpper;
  @JsonKey()
  @override
  final int interestedInAgeLower;

  @override
  String toString() {
    return 'MatchingPreferencesFormState(searchRadius: $searchRadius, interestedInAgeUpper: $interestedInAgeUpper, interestedInAgeLower: $interestedInAgeLower)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchingPreferencesFormState &&
            const DeepCollectionEquality()
                .equals(other.searchRadius, searchRadius) &&
            const DeepCollectionEquality()
                .equals(other.interestedInAgeUpper, interestedInAgeUpper) &&
            const DeepCollectionEquality()
                .equals(other.interestedInAgeLower, interestedInAgeLower));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(searchRadius),
      const DeepCollectionEquality().hash(interestedInAgeUpper),
      const DeepCollectionEquality().hash(interestedInAgeLower));

  @JsonKey(ignore: true)
  @override
  _$MatchingPreferencesFormStateCopyWith<_MatchingPreferencesFormState>
      get copyWith => __$MatchingPreferencesFormStateCopyWithImpl<
          _MatchingPreferencesFormState>(this, _$identity);
}

abstract class _MatchingPreferencesFormState
    extends MatchingPreferencesFormState {
  factory _MatchingPreferencesFormState(
      {int searchRadius,
      int interestedInAgeUpper,
      int interestedInAgeLower}) = _$_MatchingPreferencesFormState;
  _MatchingPreferencesFormState._() : super._();

  @override
  int get searchRadius;
  @override
  int get interestedInAgeUpper;
  @override
  int get interestedInAgeLower;
  @override
  @JsonKey(ignore: true)
  _$MatchingPreferencesFormStateCopyWith<_MatchingPreferencesFormState>
      get copyWith => throw _privateConstructorUsedError;
}
