// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_verification_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserVerificationInfo _$UserVerificationInfoFromJson(Map<String, dynamic> json) {
  return _UserVerificationInfo.fromJson(json);
}

/// @nodoc
class _$UserVerificationInfoTearOff {
  const _$UserVerificationInfoTearOff();

  _UserVerificationInfo call(
      {@JsonKey(name: 'linkedin_approved')
          required bool linkedinApproved,
      @JsonKey(name: 'work_details_approved')
          required bool workDetailsApproved,
      @JsonKey(name: 'education_approved')
          required bool educationApproved,
      @JsonKey(name: 'dob_approved')
          required bool dobApproved,
      @JsonKey(name: 'selfie_approved')
          required bool selfieApproved,
      @JsonKey(name: 'identity_approved')
          required bool identityApproved,
      @JsonKey(name: 'fields_updated')
          List<String> fieldsUpdated = const <String>[],
      @JsonKey(name: 'rejection_reason')
          required String? rejectionReason,
      required String status}) {
    return _UserVerificationInfo(
      linkedinApproved: linkedinApproved,
      workDetailsApproved: workDetailsApproved,
      educationApproved: educationApproved,
      dobApproved: dobApproved,
      selfieApproved: selfieApproved,
      identityApproved: identityApproved,
      fieldsUpdated: fieldsUpdated,
      rejectionReason: rejectionReason,
      status: status,
    );
  }

  UserVerificationInfo fromJson(Map<String, Object?> json) {
    return UserVerificationInfo.fromJson(json);
  }
}

/// @nodoc
const $UserVerificationInfo = _$UserVerificationInfoTearOff();

/// @nodoc
mixin _$UserVerificationInfo {
  @JsonKey(name: 'linkedin_approved')
  bool get linkedinApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_details_approved')
  bool get workDetailsApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'education_approved')
  bool get educationApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'dob_approved')
  bool get dobApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'selfie_approved')
  bool get selfieApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_approved')
  bool get identityApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'fields_updated')
  List<String> get fieldsUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserVerificationInfoCopyWith<UserVerificationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserVerificationInfoCopyWith<$Res> {
  factory $UserVerificationInfoCopyWith(UserVerificationInfo value,
          $Res Function(UserVerificationInfo) then) =
      _$UserVerificationInfoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'linkedin_approved') bool linkedinApproved,
      @JsonKey(name: 'work_details_approved') bool workDetailsApproved,
      @JsonKey(name: 'education_approved') bool educationApproved,
      @JsonKey(name: 'dob_approved') bool dobApproved,
      @JsonKey(name: 'selfie_approved') bool selfieApproved,
      @JsonKey(name: 'identity_approved') bool identityApproved,
      @JsonKey(name: 'fields_updated') List<String> fieldsUpdated,
      @JsonKey(name: 'rejection_reason') String? rejectionReason,
      String status});
}

/// @nodoc
class _$UserVerificationInfoCopyWithImpl<$Res>
    implements $UserVerificationInfoCopyWith<$Res> {
  _$UserVerificationInfoCopyWithImpl(this._value, this._then);

  final UserVerificationInfo _value;
  // ignore: unused_field
  final $Res Function(UserVerificationInfo) _then;

  @override
  $Res call({
    Object? linkedinApproved = freezed,
    Object? workDetailsApproved = freezed,
    Object? educationApproved = freezed,
    Object? dobApproved = freezed,
    Object? selfieApproved = freezed,
    Object? identityApproved = freezed,
    Object? fieldsUpdated = freezed,
    Object? rejectionReason = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      linkedinApproved: linkedinApproved == freezed
          ? _value.linkedinApproved
          : linkedinApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      workDetailsApproved: workDetailsApproved == freezed
          ? _value.workDetailsApproved
          : workDetailsApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      educationApproved: educationApproved == freezed
          ? _value.educationApproved
          : educationApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      dobApproved: dobApproved == freezed
          ? _value.dobApproved
          : dobApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      selfieApproved: selfieApproved == freezed
          ? _value.selfieApproved
          : selfieApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      identityApproved: identityApproved == freezed
          ? _value.identityApproved
          : identityApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      fieldsUpdated: fieldsUpdated == freezed
          ? _value.fieldsUpdated
          : fieldsUpdated // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rejectionReason: rejectionReason == freezed
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserVerificationInfoCopyWith<$Res>
    implements $UserVerificationInfoCopyWith<$Res> {
  factory _$UserVerificationInfoCopyWith(_UserVerificationInfo value,
          $Res Function(_UserVerificationInfo) then) =
      __$UserVerificationInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'linkedin_approved') bool linkedinApproved,
      @JsonKey(name: 'work_details_approved') bool workDetailsApproved,
      @JsonKey(name: 'education_approved') bool educationApproved,
      @JsonKey(name: 'dob_approved') bool dobApproved,
      @JsonKey(name: 'selfie_approved') bool selfieApproved,
      @JsonKey(name: 'identity_approved') bool identityApproved,
      @JsonKey(name: 'fields_updated') List<String> fieldsUpdated,
      @JsonKey(name: 'rejection_reason') String? rejectionReason,
      String status});
}

/// @nodoc
class __$UserVerificationInfoCopyWithImpl<$Res>
    extends _$UserVerificationInfoCopyWithImpl<$Res>
    implements _$UserVerificationInfoCopyWith<$Res> {
  __$UserVerificationInfoCopyWithImpl(
      _UserVerificationInfo _value, $Res Function(_UserVerificationInfo) _then)
      : super(_value, (v) => _then(v as _UserVerificationInfo));

  @override
  _UserVerificationInfo get _value => super._value as _UserVerificationInfo;

  @override
  $Res call({
    Object? linkedinApproved = freezed,
    Object? workDetailsApproved = freezed,
    Object? educationApproved = freezed,
    Object? dobApproved = freezed,
    Object? selfieApproved = freezed,
    Object? identityApproved = freezed,
    Object? fieldsUpdated = freezed,
    Object? rejectionReason = freezed,
    Object? status = freezed,
  }) {
    return _then(_UserVerificationInfo(
      linkedinApproved: linkedinApproved == freezed
          ? _value.linkedinApproved
          : linkedinApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      workDetailsApproved: workDetailsApproved == freezed
          ? _value.workDetailsApproved
          : workDetailsApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      educationApproved: educationApproved == freezed
          ? _value.educationApproved
          : educationApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      dobApproved: dobApproved == freezed
          ? _value.dobApproved
          : dobApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      selfieApproved: selfieApproved == freezed
          ? _value.selfieApproved
          : selfieApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      identityApproved: identityApproved == freezed
          ? _value.identityApproved
          : identityApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      fieldsUpdated: fieldsUpdated == freezed
          ? _value.fieldsUpdated
          : fieldsUpdated // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rejectionReason: rejectionReason == freezed
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserVerificationInfo implements _UserVerificationInfo {
  _$_UserVerificationInfo(
      {@JsonKey(name: 'linkedin_approved') required this.linkedinApproved,
      @JsonKey(name: 'work_details_approved') required this.workDetailsApproved,
      @JsonKey(name: 'education_approved') required this.educationApproved,
      @JsonKey(name: 'dob_approved') required this.dobApproved,
      @JsonKey(name: 'selfie_approved') required this.selfieApproved,
      @JsonKey(name: 'identity_approved') required this.identityApproved,
      @JsonKey(name: 'fields_updated') this.fieldsUpdated = const <String>[],
      @JsonKey(name: 'rejection_reason') required this.rejectionReason,
      required this.status});

  factory _$_UserVerificationInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UserVerificationInfoFromJson(json);

  @override
  @JsonKey(name: 'linkedin_approved')
  final bool linkedinApproved;
  @override
  @JsonKey(name: 'work_details_approved')
  final bool workDetailsApproved;
  @override
  @JsonKey(name: 'education_approved')
  final bool educationApproved;
  @override
  @JsonKey(name: 'dob_approved')
  final bool dobApproved;
  @override
  @JsonKey(name: 'selfie_approved')
  final bool selfieApproved;
  @override
  @JsonKey(name: 'identity_approved')
  final bool identityApproved;
  @override
  @JsonKey(name: 'fields_updated')
  final List<String> fieldsUpdated;
  @override
  @JsonKey(name: 'rejection_reason')
  final String? rejectionReason;
  @override
  final String status;

  @override
  String toString() {
    return 'UserVerificationInfo(linkedinApproved: $linkedinApproved, workDetailsApproved: $workDetailsApproved, educationApproved: $educationApproved, dobApproved: $dobApproved, selfieApproved: $selfieApproved, identityApproved: $identityApproved, fieldsUpdated: $fieldsUpdated, rejectionReason: $rejectionReason, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserVerificationInfo &&
            const DeepCollectionEquality()
                .equals(other.linkedinApproved, linkedinApproved) &&
            const DeepCollectionEquality()
                .equals(other.workDetailsApproved, workDetailsApproved) &&
            const DeepCollectionEquality()
                .equals(other.educationApproved, educationApproved) &&
            const DeepCollectionEquality()
                .equals(other.dobApproved, dobApproved) &&
            const DeepCollectionEquality()
                .equals(other.selfieApproved, selfieApproved) &&
            const DeepCollectionEquality()
                .equals(other.identityApproved, identityApproved) &&
            const DeepCollectionEquality()
                .equals(other.fieldsUpdated, fieldsUpdated) &&
            const DeepCollectionEquality()
                .equals(other.rejectionReason, rejectionReason) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(linkedinApproved),
      const DeepCollectionEquality().hash(workDetailsApproved),
      const DeepCollectionEquality().hash(educationApproved),
      const DeepCollectionEquality().hash(dobApproved),
      const DeepCollectionEquality().hash(selfieApproved),
      const DeepCollectionEquality().hash(identityApproved),
      const DeepCollectionEquality().hash(fieldsUpdated),
      const DeepCollectionEquality().hash(rejectionReason),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$UserVerificationInfoCopyWith<_UserVerificationInfo> get copyWith =>
      __$UserVerificationInfoCopyWithImpl<_UserVerificationInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserVerificationInfoToJson(this);
  }
}

abstract class _UserVerificationInfo implements UserVerificationInfo {
  factory _UserVerificationInfo(
      {@JsonKey(name: 'linkedin_approved') required bool linkedinApproved,
      @JsonKey(name: 'work_details_approved') required bool workDetailsApproved,
      @JsonKey(name: 'education_approved') required bool educationApproved,
      @JsonKey(name: 'dob_approved') required bool dobApproved,
      @JsonKey(name: 'selfie_approved') required bool selfieApproved,
      @JsonKey(name: 'identity_approved') required bool identityApproved,
      @JsonKey(name: 'fields_updated') List<String> fieldsUpdated,
      @JsonKey(name: 'rejection_reason') required String? rejectionReason,
      required String status}) = _$_UserVerificationInfo;

  factory _UserVerificationInfo.fromJson(Map<String, dynamic> json) =
      _$_UserVerificationInfo.fromJson;

  @override
  @JsonKey(name: 'linkedin_approved')
  bool get linkedinApproved;
  @override
  @JsonKey(name: 'work_details_approved')
  bool get workDetailsApproved;
  @override
  @JsonKey(name: 'education_approved')
  bool get educationApproved;
  @override
  @JsonKey(name: 'dob_approved')
  bool get dobApproved;
  @override
  @JsonKey(name: 'selfie_approved')
  bool get selfieApproved;
  @override
  @JsonKey(name: 'identity_approved')
  bool get identityApproved;
  @override
  @JsonKey(name: 'fields_updated')
  List<String> get fieldsUpdated;
  @override
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$UserVerificationInfoCopyWith<_UserVerificationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
