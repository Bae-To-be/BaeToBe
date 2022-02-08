// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      name: json['name'] as String,
      course: json['course'] as String?,
      industry: json['industry'] as String?,
      company: json['company'] as String?,
      university: json['university'] as String?,
      workTitle: json['work_title'] as String?,
      birthday: json['birthday'] as String?,
      gender: json['gender'] as String?,
      linkedInURL: json['linkedin_url'] as String?,
      age: json['age'] as int?,
      linkedInPublic: json['linkedin_public'] as bool?,
      bio: json['bio'] as String?,
      searchRadius: json['search_radius'] as int?,
      interestedAgeLower: json['interested_age_lower'] as int?,
      interestedAgeUpper: json['interested_age_upper'] as int?,
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
      height: json['height_in_cms'] as int?,
      status: json['status'] as String?,
      languages: (json['languages'] as List<dynamic>)
          .map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      interestedGenders: (json['interested_genders'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      education: (json['education'] as List<dynamic>)
          .map((e) => UserEducation.fromJson(e as Map<String, dynamic>))
          .toList(),
      hometown: UserHometown.fromJson(json['hometown'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'course': instance.course,
      'industry': instance.industry,
      'company': instance.company,
      'university': instance.university,
      'work_title': instance.workTitle,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'linkedin_url': instance.linkedInURL,
      'age': instance.age,
      'linkedin_public': instance.linkedInPublic,
      'bio': instance.bio,
      'search_radius': instance.searchRadius,
      'interested_age_lower': instance.interestedAgeLower,
      'interested_age_upper': instance.interestedAgeUpper,
      'religion': instance.religion?.toJson(),
      'smoking_preference': instance.smoking?.toJson(),
      'food_preference': instance.food?.toJson(),
      'drinking_preference': instance.drinking?.toJson(),
      'children_preference': instance.children?.toJson(),
      'exercise_preference': instance.exercise?.toJson(),
      'height_in_cms': instance.height,
      'status': instance.status,
      'languages': instance.languages.map((e) => e.toJson()).toList(),
      'interested_genders': instance.interestedGenders,
      'education': instance.education.map((e) => e.toJson()).toList(),
      'hometown': instance.hometown.toJson(),
    };
