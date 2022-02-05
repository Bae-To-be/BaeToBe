// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthInformation _$$_AuthInformationFromJson(Map<String, dynamic> json) =>
    _$_AuthInformation(
      accessToken: json['accessToken'] as String? ?? 'access_token',
      refreshToken: json['refreshToken'] as String? ?? 'refresh_token',
      expiresIn: json['expiresIn'] as int? ?? 'expires_in',
      fetchedAt: DateTime.parse(json['fetchedAt'] as String) ?? 'fetched_at',
    );

Map<String, dynamic> _$$_AuthInformationToJson(_$_AuthInformation instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'fetchedAt': instance.fetchedAt.toIso8601String(),
    };
