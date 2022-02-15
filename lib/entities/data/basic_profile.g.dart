// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BasicProfile _$$_BasicProfileFromJson(Map<String, dynamic> json) =>
    _$_BasicProfile(
      userName: json['name'] as String,
      age: json['age'] as int,
      profilePicture: json['profile_picture'] == null
          ? null
          : UserImage.fromJson(json['profile_picture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BasicProfileToJson(_$_BasicProfile instance) =>
    <String, dynamic>{
      'name': instance.userName,
      'age': instance.age,
      'profile_picture': instance.profilePicture?.toJson(),
    };
