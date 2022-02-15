// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      id: json['id'] as int,
      name: json['name'] as String,
      gender: json['gender'] as String,
      age: json['age'] as int,
      workTitle: json['work_title'] as String,
      company: json['company'] as String,
      industry: json['industry'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => UserImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'age': instance.age,
      'work_title': instance.workTitle,
      'company': instance.company,
      'industry': instance.industry,
      'images': instance.images.map((e) => e.toJson()).toList(),
    };
