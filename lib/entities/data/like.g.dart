// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Like _$$_LikeFromJson(Map<String, dynamic> json) => _$_Like(
      id: Readers.readId(json, '_id') as int,
      userName: Like._readUser(json, 'name') as String,
      userId: Like._readUser(json, 'id') as int,
      summary: Like._readUser(json, 'summary') as String,
      age: Like._readUser(json, 'age') as int,
      timeSinceCreation: json['time_since_creation'] as String,
      profilePicture: Like._readUser(json, 'profile_picture') == null
          ? null
          : UserImage.fromJson(
              Like._readUser(json, 'profile_picture') as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LikeToJson(_$_Like instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.userName,
      'id': instance.userId,
      'summary': instance.summary,
      'age': instance.age,
      'time_since_creation': instance.timeSinceCreation,
      'profile_picture': instance.profilePicture?.toJson(),
    };
