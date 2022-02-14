// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailedProfile _$$_DetailedProfileFromJson(Map<String, dynamic> json) =>
    _$_DetailedProfile(
      id: json['id'] as int,
      name: json['name'] as String,
      gender: json['gender'] as String,
      age: json['age'] as int,
      company: json['company'] as String,
      industry: json['industry'] as String,
      linkedinUrl: json['linkedin_url'] as String?,
      bio: json['bio'] as String?,
      hometown: UserHometown.fromJson(json['hometown'] as Map<String, dynamic>),
      religion: json['religion'] == null
          ? null
          : Religion.fromJson(json['religion'] as Map<String, dynamic>),
      smoking: json['smoking_preference'] == null
          ? null
          : Preference.fromJson(
              json['smoking_preference'] as Map<String, dynamic>),
      food: json['food_preference'] == null
          ? null
          : Preference.fromJson(
              json['food_preference'] as Map<String, dynamic>),
      drinking: json['drinking_preference'] == null
          ? null
          : Preference.fromJson(
              json['drinking_preference'] as Map<String, dynamic>),
      children: json['children_preference'] == null
          ? null
          : Preference.fromJson(
              json['children_preference'] as Map<String, dynamic>),
      exercise: json['exercise_preference'] == null
          ? null
          : Preference.fromJson(
              json['exercise_preference'] as Map<String, dynamic>),
      heightInCms: json['height_in_cms'] as int?,
      matchStatus: json['status'] as String,
      match: json['match'] == null
          ? null
          : Match.fromJson(json['match'] as Map<String, dynamic>),
      isReported: json['is_reported'] as bool,
      languages: (json['languages'] as List<dynamic>)
          .map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      education: (json['education'] as List<dynamic>)
          .map((e) => UserEducation.fromJson(e as Map<String, dynamic>))
          .toList(),
      workTitle: json['work_title'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => UserImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DetailedProfileToJson(_$_DetailedProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'age': instance.age,
      'company': instance.company,
      'industry': instance.industry,
      'linkedin_url': instance.linkedinUrl,
      'bio': instance.bio,
      'hometown': instance.hometown.toJson(),
      'religion': instance.religion?.toJson(),
      'smoking_preference': instance.smoking?.toJson(),
      'food_preference': instance.food?.toJson(),
      'drinking_preference': instance.drinking?.toJson(),
      'children_preference': instance.children?.toJson(),
      'exercise_preference': instance.exercise?.toJson(),
      'height_in_cms': instance.heightInCms,
      'status': instance.matchStatus,
      'match': instance.match?.toJson(),
      'is_reported': instance.isReported,
      'languages': instance.languages.map((e) => e.toJson()).toList(),
      'education': instance.education.map((e) => e.toJson()).toList(),
      'work_title': instance.workTitle,
      'images': instance.images.map((e) => e.toJson()).toList(),
    };
