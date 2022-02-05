// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthInformation _$$_AuthInformationFromJson(Map<String, dynamic> json) =>
    _$_AuthInformation(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: json['expires_in'] as int,
      fetchedAt: DateTime.parse(json['fetched_at'] as String),
    );

Map<String, dynamic> _$$_AuthInformationToJson(_$_AuthInformation instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'fetched_at': instance.fetchedAt.toIso8601String(),
    };
