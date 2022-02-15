// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Match _$$_MatchFromJson(Map<String, dynamic> json) => _$_Match(
      id: Readers.readId(json, '_id') as int,
      basicProfile:
          BasicProfile.fromJson(json['matched_user'] as Map<String, dynamic>),
      closedBy: json['closed_by'] as int?,
      isClosed: json['is_closed'] as bool,
      userId: Match._readUser(json, 'id') as int,
      timeSinceUpdate: json['time_since_update'] as String,
      unreadCount: json['unread_count'] as int? ?? 0,
      updatedAt: Readers.parseInt(json, 'updated_at') as int,
    );

Map<String, dynamic> _$$_MatchToJson(_$_Match instance) => <String, dynamic>{
      '_id': instance.id,
      'matched_user': instance.basicProfile.toJson(),
      'closed_by': instance.closedBy,
      'is_closed': instance.isClosed,
      'id': instance.userId,
      'time_since_update': instance.timeSinceUpdate,
      'unread_count': instance.unreadCount,
      'updated_at': instance.updatedAt,
    };
