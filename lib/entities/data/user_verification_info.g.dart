// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_verification_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserVerificationInfo _$$_UserVerificationInfoFromJson(
        Map<String, dynamic> json) =>
    _$_UserVerificationInfo(
      linkedinApproved: json['linkedin_approved'] as bool,
      workDetailsApproved: json['work_details_approved'] as bool,
      educationApproved: json['education_approved'] as bool,
      dobApproved: json['dob_approved'] as bool,
      selfieApproved: json['selfie_approved'] as bool,
      identityApproved: json['identity_approved'] as bool,
      fieldsUpdated: (json['fields_updated'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      rejectionReason: json['rejection_reason'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_UserVerificationInfoToJson(
        _$_UserVerificationInfo instance) =>
    <String, dynamic>{
      'linkedin_approved': instance.linkedinApproved,
      'work_details_approved': instance.workDetailsApproved,
      'education_approved': instance.educationApproved,
      'dob_approved': instance.dobApproved,
      'selfie_approved': instance.selfieApproved,
      'identity_approved': instance.identityApproved,
      'fields_updated': instance.fieldsUpdated,
      'rejection_reason': instance.rejectionReason,
      'status': instance.status,
    };
