// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'industry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Industry _$IndustryFromJson(Map<String, dynamic> json) {
  return _Industry.fromJson(json);
}

/// @nodoc
class _$IndustryTearOff {
  const _$IndustryTearOff();

  _Industry call({required String name, required int id}) {
    return _Industry(
      name: name,
      id: id,
    );
  }

  Industry fromJson(Map<String, Object?> json) {
    return Industry.fromJson(json);
  }
}

/// @nodoc
const $Industry = _$IndustryTearOff();

/// @nodoc
mixin _$Industry {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndustryCopyWith<Industry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndustryCopyWith<$Res> {
  factory $IndustryCopyWith(Industry value, $Res Function(Industry) then) =
      _$IndustryCopyWithImpl<$Res>;
  $Res call({String name, int id});
}

/// @nodoc
class _$IndustryCopyWithImpl<$Res> implements $IndustryCopyWith<$Res> {
  _$IndustryCopyWithImpl(this._value, this._then);

  final Industry _value;
  // ignore: unused_field
  final $Res Function(Industry) _then;

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
abstract class _$IndustryCopyWith<$Res> implements $IndustryCopyWith<$Res> {
  factory _$IndustryCopyWith(_Industry value, $Res Function(_Industry) then) =
      __$IndustryCopyWithImpl<$Res>;
  @override
  $Res call({String name, int id});
}

/// @nodoc
class __$IndustryCopyWithImpl<$Res> extends _$IndustryCopyWithImpl<$Res>
    implements _$IndustryCopyWith<$Res> {
  __$IndustryCopyWithImpl(_Industry _value, $Res Function(_Industry) _then)
      : super(_value, (v) => _then(v as _Industry));

  @override
  _Industry get _value => super._value as _Industry;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_Industry(
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
class _$_Industry implements _Industry {
  _$_Industry({required this.name, required this.id});

  factory _$_Industry.fromJson(Map<String, dynamic> json) =>
      _$$_IndustryFromJson(json);

  @override
  final String name;
  @override
  final int id;

  @override
  String toString() {
    return 'Industry(name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Industry &&
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
  _$IndustryCopyWith<_Industry> get copyWith =>
      __$IndustryCopyWithImpl<_Industry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IndustryToJson(this);
  }
}

abstract class _Industry implements Industry {
  factory _Industry({required String name, required int id}) = _$_Industry;

  factory _Industry.fromJson(Map<String, dynamic> json) = _$_Industry.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$IndustryCopyWith<_Industry> get copyWith =>
      throw _privateConstructorUsedError;
}
