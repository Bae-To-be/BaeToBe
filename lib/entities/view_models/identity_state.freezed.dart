// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'identity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IdentityStateTearOff {
  const _$IdentityStateTearOff();

  _IdentityState call(
      {bool uploaded = false, bool uploading = false, String? fileName}) {
    return _IdentityState(
      uploaded: uploaded,
      uploading: uploading,
      fileName: fileName,
    );
  }
}

/// @nodoc
const $IdentityState = _$IdentityStateTearOff();

/// @nodoc
mixin _$IdentityState {
  bool get uploaded => throw _privateConstructorUsedError;
  bool get uploading => throw _privateConstructorUsedError;
  String? get fileName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IdentityStateCopyWith<IdentityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentityStateCopyWith<$Res> {
  factory $IdentityStateCopyWith(
          IdentityState value, $Res Function(IdentityState) then) =
      _$IdentityStateCopyWithImpl<$Res>;
  $Res call({bool uploaded, bool uploading, String? fileName});
}

/// @nodoc
class _$IdentityStateCopyWithImpl<$Res>
    implements $IdentityStateCopyWith<$Res> {
  _$IdentityStateCopyWithImpl(this._value, this._then);

  final IdentityState _value;
  // ignore: unused_field
  final $Res Function(IdentityState) _then;

  @override
  $Res call({
    Object? uploaded = freezed,
    Object? uploading = freezed,
    Object? fileName = freezed,
  }) {
    return _then(_value.copyWith(
      uploaded: uploaded == freezed
          ? _value.uploaded
          : uploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      uploading: uploading == freezed
          ? _value.uploading
          : uploading // ignore: cast_nullable_to_non_nullable
              as bool,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$IdentityStateCopyWith<$Res>
    implements $IdentityStateCopyWith<$Res> {
  factory _$IdentityStateCopyWith(
          _IdentityState value, $Res Function(_IdentityState) then) =
      __$IdentityStateCopyWithImpl<$Res>;
  @override
  $Res call({bool uploaded, bool uploading, String? fileName});
}

/// @nodoc
class __$IdentityStateCopyWithImpl<$Res>
    extends _$IdentityStateCopyWithImpl<$Res>
    implements _$IdentityStateCopyWith<$Res> {
  __$IdentityStateCopyWithImpl(
      _IdentityState _value, $Res Function(_IdentityState) _then)
      : super(_value, (v) => _then(v as _IdentityState));

  @override
  _IdentityState get _value => super._value as _IdentityState;

  @override
  $Res call({
    Object? uploaded = freezed,
    Object? uploading = freezed,
    Object? fileName = freezed,
  }) {
    return _then(_IdentityState(
      uploaded: uploaded == freezed
          ? _value.uploaded
          : uploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      uploading: uploading == freezed
          ? _value.uploading
          : uploading // ignore: cast_nullable_to_non_nullable
              as bool,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_IdentityState implements _IdentityState {
  _$_IdentityState(
      {this.uploaded = false, this.uploading = false, this.fileName});

  @JsonKey()
  @override
  final bool uploaded;
  @JsonKey()
  @override
  final bool uploading;
  @override
  final String? fileName;

  @override
  String toString() {
    return 'IdentityState(uploaded: $uploaded, uploading: $uploading, fileName: $fileName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IdentityState &&
            const DeepCollectionEquality().equals(other.uploaded, uploaded) &&
            const DeepCollectionEquality().equals(other.uploading, uploading) &&
            const DeepCollectionEquality().equals(other.fileName, fileName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uploaded),
      const DeepCollectionEquality().hash(uploading),
      const DeepCollectionEquality().hash(fileName));

  @JsonKey(ignore: true)
  @override
  _$IdentityStateCopyWith<_IdentityState> get copyWith =>
      __$IdentityStateCopyWithImpl<_IdentityState>(this, _$identity);
}

abstract class _IdentityState implements IdentityState {
  factory _IdentityState({bool uploaded, bool uploading, String? fileName}) =
      _$_IdentityState;

  @override
  bool get uploaded;
  @override
  bool get uploading;
  @override
  String? get fileName;
  @override
  @JsonKey(ignore: true)
  _$IdentityStateCopyWith<_IdentityState> get copyWith =>
      throw _privateConstructorUsedError;
}
