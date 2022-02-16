// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Like _$$_LikeFromJson(Map<String, dynamic> json) => _$_Like(
      id: json['id'] as int,
      user: BasicProfile.fromJson(json['user'] as Map<String, dynamic>),
      timeSinceCreation: json['time_since_creation'] as String,
    );

Map<String, dynamic> _$$_LikeToJson(_$_Like instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'time_since_creation': instance.timeSinceCreation,
    };
