// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'preference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Preference _$PreferenceFromJson(Map<String, dynamic> json) {
  return _Preference.fromJson(json);
}

/// @nodoc
class _$PreferenceTearOff {
  const _$PreferenceTearOff();

  _Preference call({required String name, required int id}) {
    return _Preference(
      name: name,
      id: id,
    );
  }

  Preference fromJson(Map<String, Object?> json) {
    return Preference.fromJson(json);
  }
}

/// @nodoc
const $Preference = _$PreferenceTearOff();

/// @nodoc
mixin _$Preference {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreferenceCopyWith<Preference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceCopyWith<$Res> {
  factory $PreferenceCopyWith(
          Preference value, $Res Function(Preference) then) =
      _$PreferenceCopyWithImpl<$Res>;
  $Res call({String name, int id});
}

/// @nodoc
class _$PreferenceCopyWithImpl<$Res> implements $PreferenceCopyWith<$Res> {
  _$PreferenceCopyWithImpl(this._value, this._then);

  final Preference _value;
  // ignore: unused_field
  final $Res Function(Preference) _then;

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
abstract class _$PreferenceCopyWith<$Res> implements $PreferenceCopyWith<$Res> {
  factory _$PreferenceCopyWith(
          _Preference value, $Res Function(_Preference) then) =
      __$PreferenceCopyWithImpl<$Res>;
  @override
  $Res call({String name, int id});
}

/// @nodoc
class __$PreferenceCopyWithImpl<$Res> extends _$PreferenceCopyWithImpl<$Res>
    implements _$PreferenceCopyWith<$Res> {
  __$PreferenceCopyWithImpl(
      _Preference _value, $Res Function(_Preference) _then)
      : super(_value, (v) => _then(v as _Preference));

  @override
  _Preference get _value => super._value as _Preference;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_Preference(
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
class _$_Preference implements _Preference {
  _$_Preference({required this.name, required this.id});

  factory _$_Preference.fromJson(Map<String, dynamic> json) =>
      _$$_PreferenceFromJson(json);

  @override
  final String name;
  @override
  final int id;

  @override
  String toString() {
    return 'Preference(name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Preference &&
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
  _$PreferenceCopyWith<_Preference> get copyWith =>
      __$PreferenceCopyWithImpl<_Preference>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PreferenceToJson(this);
  }
}

abstract class _Preference implements Preference {
  factory _Preference({required String name, required int id}) = _$_Preference;

  factory _Preference.fromJson(Map<String, dynamic> json) =
      _$_Preference.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$PreferenceCopyWith<_Preference> get copyWith =>
      throw _privateConstructorUsedError;
}
