// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gender.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Gender _$GenderFromJson(Map<String, dynamic> json) {
  return _Gender.fromJson(json);
}

/// @nodoc
class _$GenderTearOff {
  const _$GenderTearOff();

  _Gender call({required String name, required int id}) {
    return _Gender(
      name: name,
      id: id,
    );
  }

  Gender fromJson(Map<String, Object?> json) {
    return Gender.fromJson(json);
  }
}

/// @nodoc
const $Gender = _$GenderTearOff();

/// @nodoc
mixin _$Gender {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenderCopyWith<Gender> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderCopyWith<$Res> {
  factory $GenderCopyWith(Gender value, $Res Function(Gender) then) =
      _$GenderCopyWithImpl<$Res>;
  $Res call({String name, int id});
}

/// @nodoc
class _$GenderCopyWithImpl<$Res> implements $GenderCopyWith<$Res> {
  _$GenderCopyWithImpl(this._value, this._then);

  final Gender _value;
  // ignore: unused_field
  final $Res Function(Gender) _then;

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
abstract class _$GenderCopyWith<$Res> implements $GenderCopyWith<$Res> {
  factory _$GenderCopyWith(_Gender value, $Res Function(_Gender) then) =
      __$GenderCopyWithImpl<$Res>;
  @override
  $Res call({String name, int id});
}

/// @nodoc
class __$GenderCopyWithImpl<$Res> extends _$GenderCopyWithImpl<$Res>
    implements _$GenderCopyWith<$Res> {
  __$GenderCopyWithImpl(_Gender _value, $Res Function(_Gender) _then)
      : super(_value, (v) => _then(v as _Gender));

  @override
  _Gender get _value => super._value as _Gender;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_Gender(
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
class _$_Gender implements _Gender {
  _$_Gender({required this.name, required this.id});

  factory _$_Gender.fromJson(Map<String, dynamic> json) =>
      _$$_GenderFromJson(json);

  @override
  final String name;
  @override
  final int id;

  @override
  String toString() {
    return 'Gender(name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Gender &&
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
  _$GenderCopyWith<_Gender> get copyWith =>
      __$GenderCopyWithImpl<_Gender>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenderToJson(this);
  }
}

abstract class _Gender implements Gender {
  factory _Gender({required String name, required int id}) = _$_Gender;

  factory _Gender.fromJson(Map<String, dynamic> json) = _$_Gender.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$GenderCopyWith<_Gender> get copyWith => throw _privateConstructorUsedError;
}
