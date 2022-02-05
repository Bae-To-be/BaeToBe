// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'selfie_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SelfieStateTearOff {
  const _$SelfieStateTearOff();

  _SelfieState call({XFile? file, CameraController? controller}) {
    return _SelfieState(
      file: file,
      controller: controller,
    );
  }
}

/// @nodoc
const $SelfieState = _$SelfieStateTearOff();

/// @nodoc
mixin _$SelfieState {
  XFile? get file => throw _privateConstructorUsedError;
  CameraController? get controller => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelfieStateCopyWith<SelfieState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelfieStateCopyWith<$Res> {
  factory $SelfieStateCopyWith(
          SelfieState value, $Res Function(SelfieState) then) =
      _$SelfieStateCopyWithImpl<$Res>;
  $Res call({XFile? file, CameraController? controller});
}

/// @nodoc
class _$SelfieStateCopyWithImpl<$Res> implements $SelfieStateCopyWith<$Res> {
  _$SelfieStateCopyWithImpl(this._value, this._then);

  final SelfieState _value;
  // ignore: unused_field
  final $Res Function(SelfieState) _then;

  @override
  $Res call({
    Object? file = freezed,
    Object? controller = freezed,
  }) {
    return _then(_value.copyWith(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile?,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
    ));
  }
}

/// @nodoc
abstract class _$SelfieStateCopyWith<$Res>
    implements $SelfieStateCopyWith<$Res> {
  factory _$SelfieStateCopyWith(
          _SelfieState value, $Res Function(_SelfieState) then) =
      __$SelfieStateCopyWithImpl<$Res>;
  @override
  $Res call({XFile? file, CameraController? controller});
}

/// @nodoc
class __$SelfieStateCopyWithImpl<$Res> extends _$SelfieStateCopyWithImpl<$Res>
    implements _$SelfieStateCopyWith<$Res> {
  __$SelfieStateCopyWithImpl(
      _SelfieState _value, $Res Function(_SelfieState) _then)
      : super(_value, (v) => _then(v as _SelfieState));

  @override
  _SelfieState get _value => super._value as _SelfieState;

  @override
  $Res call({
    Object? file = freezed,
    Object? controller = freezed,
  }) {
    return _then(_SelfieState(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile?,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
    ));
  }
}

/// @nodoc

class _$_SelfieState implements _SelfieState {
  _$_SelfieState({this.file, this.controller});

  @override
  final XFile? file;
  @override
  final CameraController? controller;

  @override
  String toString() {
    return 'SelfieState(file: $file, controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelfieState &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality()
                .equals(other.controller, controller));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(controller));

  @JsonKey(ignore: true)
  @override
  _$SelfieStateCopyWith<_SelfieState> get copyWith =>
      __$SelfieStateCopyWithImpl<_SelfieState>(this, _$identity);
}

abstract class _SelfieState implements SelfieState {
  factory _SelfieState({XFile? file, CameraController? controller}) =
      _$_SelfieState;

  @override
  XFile? get file;
  @override
  CameraController? get controller;
  @override
  @JsonKey(ignore: true)
  _$SelfieStateCopyWith<_SelfieState> get copyWith =>
      throw _privateConstructorUsedError;
}
