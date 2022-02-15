// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Match _$$_MatchFromJson(Map<String, dynamic> json) => _$_Match(
      id: Readers.readId(json, '_id') as int,
      userName: Match._readUser(json, 'name') as String,
      closedBy: json['closed_by'] as int?,
      isClosed: json['is_closed'] as bool,
      userId: Match._readUser(json, 'id') as int,
      age: Match._readUser(json, 'age') as int,
      timeSinceUpdate: json['time_since_update'] as String,
      unreadCount: json['unread_count'] as int? ?? 0,
      updatedAt: Readers.parseInt(json, 'updated_at') as int,
      profilePicture: Match._readUser(json, 'profile_picture') == null
          ? null
          : UserImage.fromJson(
              Match._readUser(json, 'profile_picture') as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MatchToJson(_$_Match instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.userName,
      'closed_by': instance.closedBy,
      'is_closed': instance.isClosed,
      'id': instance.userId,
      'age': instance.age,
      'time_since_update': instance.timeSinceUpdate,
      'unread_count': instance.unreadCount,
      'updated_at': instance.updatedAt,
      'profile_picture': instance.profilePicture?.toJson(),
    };
