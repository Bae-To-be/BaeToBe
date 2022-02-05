// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'religion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Religion _$ReligionFromJson(Map<String, dynamic> json) {
  return _Religion.fromJson(json);
}

/// @nodoc
class _$ReligionTearOff {
  const _$ReligionTearOff();

  _Religion call({required String name, required int id}) {
    return _Religion(
      name: name,
      id: id,
    );
  }

  Religion fromJson(Map<String, Object?> json) {
    return Religion.fromJson(json);
  }
}

/// @nodoc
const $Religion = _$ReligionTearOff();

/// @nodoc
mixin _$Religion {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReligionCopyWith<Religion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReligionCopyWith<$Res> {
  factory $ReligionCopyWith(Religion value, $Res Function(Religion) then) =
      _$ReligionCopyWithImpl<$Res>;
  $Res call({String name, int id});
}

/// @nodoc
class _$ReligionCopyWithImpl<$Res> implements $ReligionCopyWith<$Res> {
  _$ReligionCopyWithImpl(this._value, this._then);

  final Religion _value;
  // ignore: unused_field
  final $Res Function(Religion) _then;

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
abstract class _$ReligionCopyWith<$Res> implements $ReligionCopyWith<$Res> {
  factory _$ReligionCopyWith(_Religion value, $Res Function(_Religion) then) =
      __$ReligionCopyWithImpl<$Res>;
  @override
  $Res call({String name, int id});
}

/// @nodoc
class __$ReligionCopyWithImpl<$Res> extends _$ReligionCopyWithImpl<$Res>
    implements _$ReligionCopyWith<$Res> {
  __$ReligionCopyWithImpl(_Religion _value, $Res Function(_Religion) _then)
      : super(_value, (v) => _then(v as _Religion));

  @override
  _Religion get _value => super._value as _Religion;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_Religion(
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
class _$_Religion implements _Religion {
  _$_Religion({required this.name, required this.id});

  factory _$_Religion.fromJson(Map<String, dynamic> json) =>
      _$$_ReligionFromJson(json);

  @override
  final String name;
  @override
  final int id;

  @override
  String toString() {
    return 'Religion(name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Religion &&
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
  _$ReligionCopyWith<_Religion> get copyWith =>
      __$ReligionCopyWithImpl<_Religion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReligionToJson(this);
  }
}

abstract class _Religion implements Religion {
  factory _Religion({required String name, required int id}) = _$_Religion;

  factory _Religion.fromJson(Map<String, dynamic> json) = _$_Religion.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$ReligionCopyWith<_Religion> get copyWith =>
      throw _privateConstructorUsedError;
}
