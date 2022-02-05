// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'work_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WorkFormStateTearOff {
  const _$WorkFormStateTearOff();

  _WorkFormState call(
      {int? industryId, String? workTitleName, String? companyName}) {
    return _WorkFormState(
      industryId: industryId,
      workTitleName: workTitleName,
      companyName: companyName,
    );
  }
}

/// @nodoc
const $WorkFormState = _$WorkFormStateTearOff();

/// @nodoc
mixin _$WorkFormState {
  int? get industryId => throw _privateConstructorUsedError;
  String? get workTitleName => throw _privateConstructorUsedError;
  String? get companyName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkFormStateCopyWith<WorkFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkFormStateCopyWith<$Res> {
  factory $WorkFormStateCopyWith(
          WorkFormState value, $Res Function(WorkFormState) then) =
      _$WorkFormStateCopyWithImpl<$Res>;
  $Res call({int? industryId, String? workTitleName, String? companyName});
}

/// @nodoc
class _$WorkFormStateCopyWithImpl<$Res>
    implements $WorkFormStateCopyWith<$Res> {
  _$WorkFormStateCopyWithImpl(this._value, this._then);

  final WorkFormState _value;
  // ignore: unused_field
  final $Res Function(WorkFormState) _then;

  @override
  $Res call({
    Object? industryId = freezed,
    Object? workTitleName = freezed,
    Object? companyName = freezed,
  }) {
    return _then(_value.copyWith(
      industryId: industryId == freezed
          ? _value.industryId
          : industryId // ignore: cast_nullable_to_non_nullable
              as int?,
      workTitleName: workTitleName == freezed
          ? _value.workTitleName
          : workTitleName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$WorkFormStateCopyWith<$Res>
    implements $WorkFormStateCopyWith<$Res> {
  factory _$WorkFormStateCopyWith(
          _WorkFormState value, $Res Function(_WorkFormState) then) =
      __$WorkFormStateCopyWithImpl<$Res>;
  @override
  $Res call({int? industryId, String? workTitleName, String? companyName});
}

/// @nodoc
class __$WorkFormStateCopyWithImpl<$Res>
    extends _$WorkFormStateCopyWithImpl<$Res>
    implements _$WorkFormStateCopyWith<$Res> {
  __$WorkFormStateCopyWithImpl(
      _WorkFormState _value, $Res Function(_WorkFormState) _then)
      : super(_value, (v) => _then(v as _WorkFormState));

  @override
  _WorkFormState get _value => super._value as _WorkFormState;

  @override
  $Res call({
    Object? industryId = freezed,
    Object? workTitleName = freezed,
    Object? companyName = freezed,
  }) {
    return _then(_WorkFormState(
      industryId: industryId == freezed
          ? _value.industryId
          : industryId // ignore: cast_nullable_to_non_nullable
              as int?,
      workTitleName: workTitleName == freezed
          ? _value.workTitleName
          : workTitleName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_WorkFormState extends _WorkFormState {
  _$_WorkFormState({this.industryId, this.workTitleName, this.companyName})
      : super._();

  @override
  final int? industryId;
  @override
  final String? workTitleName;
  @override
  final String? companyName;

  @override
  String toString() {
    return 'WorkFormState(industryId: $industryId, workTitleName: $workTitleName, companyName: $companyName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkFormState &&
            const DeepCollectionEquality()
                .equals(other.industryId, industryId) &&
            const DeepCollectionEquality()
                .equals(other.workTitleName, workTitleName) &&
            const DeepCollectionEquality()
                .equals(other.companyName, companyName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(industryId),
      const DeepCollectionEquality().hash(workTitleName),
      const DeepCollectionEquality().hash(companyName));

  @JsonKey(ignore: true)
  @override
  _$WorkFormStateCopyWith<_WorkFormState> get copyWith =>
      __$WorkFormStateCopyWithImpl<_WorkFormState>(this, _$identity);
}

abstract class _WorkFormState extends WorkFormState {
  factory _WorkFormState(
      {int? industryId,
      String? workTitleName,
      String? companyName}) = _$_WorkFormState;
  _WorkFormState._() : super._();

  @override
  int? get industryId;
  @override
  String? get workTitleName;
  @override
  String? get companyName;
  @override
  @JsonKey(ignore: true)
  _$WorkFormStateCopyWith<_WorkFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
