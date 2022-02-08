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
      smoking: json['smoking'] == null
          ? null
          : Preference.fromJson(json['smoking'] as Map<String, dynamic>),
      food: json['food'] == null
          ? null
          : Preference.fromJson(json['food'] as Map<String, dynamic>),
      drinking: json['drinking'] == null
          ? null
          : Preference.fromJson(json['drinking'] as Map<String, dynamic>),
      children: json['children'] == null
          ? null
          : Preference.fromJson(json['children'] as Map<String, dynamic>),
      exercise: json['exercise'] == null
          ? null
          : Preference.fromJson(json['exercise'] as Map<String, dynamic>),
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
      'smoking': instance.smoking?.toJson(),
      'food': instance.food?.toJson(),
      'drinking': instance.drinking?.toJson(),
      'children': instance.children?.toJson(),
      'exercise': instance.exercise?.toJson(),
      'height_in_cms': instance.heightInCms,
      'status': instance.matchStatus,
      'match': instance.match?.toJson(),
      'is_reported': instance.isReported,
      'languages': instance.languages.map((e) => e.toJson()).toList(),
      'education': instance.education.map((e) => e.toJson()).toList(),
      'work_title': instance.workTitle,
      'images': instance.images.map((e) => e.toJson()).toList(),
    };
