import 'package:baetobe/entities/data/language.dart';
import 'package:baetobe/entities/data/preference.dart';
import 'package:baetobe/entities/data/religion.dart';
import 'package:baetobe/entities/data/user_education.dart';
import 'package:baetobe/entities/data/user_hometown.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  User._();

  factory User({
    required int id,
    required String name,
    String? course,
    String? industry,
    String? company,
    String? university,
    @JsonKey(name: 'work_title') String? workTitle,
    String? birthday,
    String? gender,
    @JsonKey(name: 'linkedin_url') String? linkedInURL,
    int? age,
    @JsonKey(name: 'linkedin_public') bool? linkedInPublic,
    String? bio,
    @JsonKey(name: 'search_radius') int? searchRadius,
    @JsonKey(name: 'interested_age_lower') int? interestedAgeLower,
    @JsonKey(name: 'interested_age_upper') int? interestedAgeUpper,
    Religion? religion,
    @JsonKey(name: 'smoking_preference') Preference? smoking,
    @JsonKey(name: 'food_preference') Preference? food,
    @JsonKey(name: 'drinking_preference') Preference? drinking,
    @JsonKey(name: 'children_preference') Preference? children,
    @JsonKey(name: 'height_in_cms') int? height,
    String? status,
    required List<Language> languages,
    @JsonKey(name: 'interested_genders')
        required List<String> interestedGenders,
    required List<UserEducation> education,
    required UserHometown hometown,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  bool workInformationPresent() {
    return (workTitle != null && industry != null && company != null);
  }
}
