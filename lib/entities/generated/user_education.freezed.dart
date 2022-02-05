// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_education.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserEducation _$UserEducationFromJson(Map<String, dynamic> json) {
  return _UserEducation.fromJson(json);
}

/// @nodoc
class _$UserEducationTearOff {
  const _$UserEducationTearOff();

  _UserEducation call(
      {@JsonKey(name: 'course') required String courseName,
      @JsonKey(name: 'year') required int year,
      @JsonKey(name: 'university') required String universityName}) {
    return _UserEducation(
      courseName: courseName,
      year: year,
      universityName: universityName,
    );
  }

  UserEducation fromJson(Map<String, Object?> json) {
    return UserEducation.fromJson(json);
  }
}

/// @nodoc
const $UserEducation = _$UserEducationTearOff();

/// @nodoc
mixin _$UserEducation {
  @JsonKey(name: 'course')
  String get courseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'year')
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'university')
  String get universityName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEducationCopyWith<UserEducation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEducationCopyWith<$Res> {
  factory $UserEducationCopyWith(
          UserEducation value, $Res Function(UserEducation) then) =
      _$UserEducationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'course') String courseName,
      @JsonKey(name: 'year') int year,
      @JsonKey(name: 'university') String universityName});
}

/// @nodoc
class _$UserEducationCopyWithImpl<$Res>
    implements $UserEducationCopyWith<$Res> {
  _$UserEducationCopyWithImpl(this._value, this._then);

  final UserEducation _value;
  // ignore: unused_field
  final $Res Function(UserEducation) _then;

  @override
  $Res call({
    Object? courseName = freezed,
    Object? year = freezed,
    Object? universityName = freezed,
  }) {
    return _then(_value.copyWith(
      courseName: courseName == freezed
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      universityName: universityName == freezed
          ? _value.universityName
          : universityName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserEducationCopyWith<$Res>
    implements $UserEducationCopyWith<$Res> {
  factory _$UserEducationCopyWith(
          _UserEducation value, $Res Function(_UserEducation) then) =
      __$UserEducationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'course') String courseName,
      @JsonKey(name: 'year') int year,
      @JsonKey(name: 'university') String universityName});
}

/// @nodoc
class __$UserEducationCopyWithImpl<$Res>
    extends _$UserEducationCopyWithImpl<$Res>
    implements _$UserEducationCopyWith<$Res> {
  __$UserEducationCopyWithImpl(
      _UserEducation _value, $Res Function(_UserEducation) _then)
      : super(_value, (v) => _then(v as _UserEducation));

  @override
  _UserEducation get _value => super._value as _UserEducation;

  @override
  $Res call({
    Object? courseName = freezed,
    Object? year = freezed,
    Object? universityName = freezed,
  }) {
    return _then(_UserEducation(
      courseName: courseName == freezed
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      universityName: universityName == freezed
          ? _value.universityName
          : universityName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserEducation extends _UserEducation {
  _$_UserEducation(
      {@JsonKey(name: 'course') required this.courseName,
      @JsonKey(name: 'year') required this.year,
      @JsonKey(name: 'university') required this.universityName})
      : super._();

  factory _$_UserEducation.fromJson(Map<String, dynamic> json) =>
      _$$_UserEducationFromJson(json);

  @override
  @JsonKey(name: 'course')
  final String courseName;
  @override
  @JsonKey(name: 'year')
  final int year;
  @override
  @JsonKey(name: 'university')
  final String universityName;

  @override
  String toString() {
    return 'UserEducation(courseName: $courseName, year: $year, universityName: $universityName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserEducation &&
            const DeepCollectionEquality()
                .equals(other.courseName, courseName) &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality()
                .equals(other.universityName, universityName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(courseName),
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(universityName));

  @JsonKey(ignore: true)
  @override
  _$UserEducationCopyWith<_UserEducation> get copyWith =>
      __$UserEducationCopyWithImpl<_UserEducation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserEducationToJson(this);
  }
}

abstract class _UserEducation extends UserEducation {
  factory _UserEducation(
          {@JsonKey(name: 'course') required String courseName,
          @JsonKey(name: 'year') required int year,
          @JsonKey(name: 'university') required String universityName}) =
      _$_UserEducation;
  _UserEducation._() : super._();

  factory _UserEducation.fromJson(Map<String, dynamic> json) =
      _$_UserEducation.fromJson;

  @override
  @JsonKey(name: 'course')
  String get courseName;
  @override
  @JsonKey(name: 'year')
  int get year;
  @override
  @JsonKey(name: 'university')
  String get universityName;
  @override
  @JsonKey(ignore: true)
  _$UserEducationCopyWith<_UserEducation> get copyWith =>
      throw _privateConstructorUsedError;
}
