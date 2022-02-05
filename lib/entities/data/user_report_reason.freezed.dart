// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_report_reason.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserReportReason _$UserReportReasonFromJson(Map<String, dynamic> json) {
  return _UserReportReason.fromJson(json);
}

/// @nodoc
class _$UserReportReasonTearOff {
  const _$UserReportReasonTearOff();

  _UserReportReason call({required String name, required int id}) {
    return _UserReportReason(
      name: name,
      id: id,
    );
  }

  UserReportReason fromJson(Map<String, Object?> json) {
    return UserReportReason.fromJson(json);
  }
}

/// @nodoc
const $UserReportReason = _$UserReportReasonTearOff();

/// @nodoc
mixin _$UserReportReason {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserReportReasonCopyWith<UserReportReason> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReportReasonCopyWith<$Res> {
  factory $UserReportReasonCopyWith(
          UserReportReason value, $Res Function(UserReportReason) then) =
      _$UserReportReasonCopyWithImpl<$Res>;
  $Res call({String name, int id});
}

/// @nodoc
class _$UserReportReasonCopyWithImpl<$Res>
    implements $UserReportReasonCopyWith<$Res> {
  _$UserReportReasonCopyWithImpl(this._value, this._then);

  final UserReportReason _value;
  // ignore: unused_field
  final $Res Function(UserReportReason) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserReportReasonCopyWith<$Res>
    implements $UserReportReasonCopyWith<$Res> {
  factory _$UserReportReasonCopyWith(
          _UserReportReason value, $Res Function(_UserReportReason) then) =
      __$UserReportReasonCopyWithImpl<$Res>;
  @override
  $Res call({String name, int id});
}

/// @nodoc
class __$UserReportReasonCopyWithImpl<$Res>
    extends _$UserReportReasonCopyWithImpl<$Res>
    implements _$UserReportReasonCopyWith<$Res> {
  __$UserReportReasonCopyWithImpl(
      _UserReportReason _value, $Res Function(_UserReportReason) _then)
      : super(_value, (v) => _then(v as _UserReportReason));

  @override
  _UserReportReason get _value => super._value as _UserReportReason;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_UserReportReason(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserReportReason implements _UserReportReason {
  _$_UserReportReason({required this.name, required this.id});

  factory _$_UserReportReason.fromJson(Map<String, dynamic> json) =>
      _$$_UserReportReasonFromJson(json);

  @override
  final String name;
  @override
  final int id;

  @override
  String toString() {
    return 'UserReportReason(name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserReportReason &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$UserReportReasonCopyWith<_UserReportReason> get copyWith =>
      __$UserReportReasonCopyWithImpl<_UserReportReason>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserReportReasonToJson(this);
  }
}

abstract class _UserReportReason implements UserReportReason {
  factory _UserReportReason({required String name, required int id}) =
      _$_UserReportReason;

  factory _UserReportReason.fromJson(Map<String, dynamic> json) =
      _$_UserReportReason.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$UserReportReasonCopyWith<_UserReportReason> get copyWith =>
      throw _privateConstructorUsedError;
}
