import 'package:baetobe/entities/data/language.dart';
import 'package:baetobe/entities/data/match.dart';
import 'package:baetobe/entities/data/preference.dart';
import 'package:baetobe/entities/data/religion.dart';
import 'package:baetobe/entities/data/user_education.dart';
import 'package:baetobe/entities/data/user_hometown.dart';
import 'package:baetobe/entities/data/user_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailed_profile.freezed.dart';
part 'detailed_profile.g.dart';

@freezed
class DetailedProfile with _$DetailedProfile {
  factory DetailedProfile(
      {required int id,
      required String name,
      required String gender,
      required int age,
      required String company,
      required String industry,
      @JsonKey(name: 'linkedin_url') required String? linkedinUrl,
      required String? bio,
      required UserHometown hometown,
      Religion? religion,
      Preference? smoking,
      Preference? food,
      Preference? drinking,
      Preference? children,
      Preference? exercise,
      @JsonKey(name: 'height_in_cms') required int? heightInCms,
      @JsonKey(name: 'status') required String matchStatus,
      required Match? match,
      @JsonKey(name: 'is_reported') required bool isReported,
      required List<Language> languages,
      required List<UserEducation> education,
      @JsonKey(name: 'work_title') required String workTitle,
      required List<UserImage> images}) = _DetailedProfile;

  factory DetailedProfile.fromJson(Map<String, dynamic> json) =>
      _$DetailedProfileFromJson(json);
}
