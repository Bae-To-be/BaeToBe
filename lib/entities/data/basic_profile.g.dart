// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BasicProfile _$$_BasicProfileFromJson(Map<String, dynamic> json) =>
    _$_BasicProfile(
      name: json['name'] as String,
      age: json['age'] as int,
      profilePicture:
          UserImage.fromJson(json['profilePicture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BasicProfileToJson(_$_BasicProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'profilePicture': instance.profilePicture.toJson(),
    };
