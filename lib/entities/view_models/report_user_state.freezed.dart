// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReportUserStateTearOff {
  const _$ReportUserStateTearOff();

  _ReportUserState call({int? selected, String? comment}) {
    return _ReportUserState(
      selected: selected,
      comment: comment,
    );
  }
}

/// @nodoc
const $ReportUserState = _$ReportUserStateTearOff();

/// @nodoc
mixin _$ReportUserState {
  int? get selected => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportUserStateCopyWith<ReportUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportUserStateCopyWith<$Res> {
  factory $ReportUserStateCopyWith(
          ReportUserState value, $Res Function(ReportUserState) then) =
      _$ReportUserStateCopyWithImpl<$Res>;
  $Res call({int? selected, String? comment});
}

/// @nodoc
class _$ReportUserStateCopyWithImpl<$Res>
    implements $ReportUserStateCopyWith<$Res> {
  _$ReportUserStateCopyWithImpl(this._value, this._then);

  final ReportUserState _value;
  // ignore: unused_field
  final $Res Function(ReportUserState) _then;

  @override
  $Res call({
    Object? selected = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ReportUserStateCopyWith<$Res>
    implements $ReportUserStateCopyWith<$Res> {
  factory _$ReportUserStateCopyWith(
          _ReportUserState value, $Res Function(_ReportUserState) then) =
      __$ReportUserStateCopyWithImpl<$Res>;
  @override
  $Res call({int? selected, String? comment});
}

/// @nodoc
class __$ReportUserStateCopyWithImpl<$Res>
    extends _$ReportUserStateCopyWithImpl<$Res>
    implements _$ReportUserStateCopyWith<$Res> {
  __$ReportUserStateCopyWithImpl(
      _ReportUserState _value, $Res Function(_ReportUserState) _then)
      : super(_value, (v) => _then(v as _ReportUserState));

  @override
  _ReportUserState get _value => super._value as _ReportUserState;

  @override
  $Res call({
    Object? selected = freezed,
    Object? comment = freezed,
  }) {
    return _then(_ReportUserState(
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ReportUserState implements _ReportUserState {
  _$_ReportUserState({this.selected, this.comment});

  @override
  final int? selected;
  @override
  final String? comment;

  @override
  String toString() {
    return 'ReportUserState(selected: $selected, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportUserState &&
            const DeepCollectionEquality().equals(other.selected, selected) &&
            const DeepCollectionEquality().equals(other.comment, comment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selected),
      const DeepCollectionEquality().hash(comment));

  @JsonKey(ignore: true)
  @override
  _$ReportUserStateCopyWith<_ReportUserState> get copyWith =>
      __$ReportUserStateCopyWithImpl<_ReportUserState>(this, _$identity);
}

abstract class _ReportUserState implements ReportUserState {
  factory _ReportUserState({int? selected, String? comment}) =
      _$_ReportUserState;

  @override
  int? get selected;
  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$ReportUserStateCopyWith<_ReportUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
