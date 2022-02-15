// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Like _$$_LikeFromJson(Map<String, dynamic> json) => _$_Like(
      id: Readers.readId(json, '_id') as int,
      basicProfile: BasicProfile.fromJson(json['user'] as Map<String, dynamic>),
      userId: Like._readUser(json, 'id') as int,
      summary: Like._readUser(json, 'summary') as String,
      timeSinceCreation: json['time_since_creation'] as String,
    );

Map<String, dynamic> _$$_LikeToJson(_$_Like instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.basicProfile.toJson(),
      'id': instance.userId,
      'summary': instance.summary,
      'time_since_creation': instance.timeSinceCreation,
    };
