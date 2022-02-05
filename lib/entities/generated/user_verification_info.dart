import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_verification_info.freezed.dart';
part 'user_verification_info.g.dart';

@freezed
class UserVerificationInfo with _$UserVerificationInfo {
  factory UserVerificationInfo({
    @JsonKey(name: 'linkedin_approved') required bool linkedinApproved,
    @JsonKey(name: 'work_details_approved') required bool workDetailsApproved,
    @JsonKey(name: 'education_approved') required bool educationApproved,
    @JsonKey(name: 'dob_approved') required bool dobApproved,
    @JsonKey(name: 'selfie_approved') required bool selfieApproved,
    @JsonKey(name: 'identity_approved') required bool identityApproved,
    @JsonKey(name: 'fields_updated')
    @Default(<String>[])
        List<String> fieldsUpdated,
    @JsonKey(name: 'rejection_reason') required String? rejectionReason,
    required String status,
  }) = _UserVerificationInfo;

  factory UserVerificationInfo.fromJson(Map<String, dynamic> json) =>
      _$UserVerificationInfoFromJson(json);
}
