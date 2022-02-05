// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hometown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserHometown _$$_UserHometownFromJson(Map<String, dynamic> json) =>
    _$_UserHometown(
      countryName: json['country_name'] as String? ?? '',
      cityName: json['city'] == null
          ? ''
          : const _CityNameConverter()
              .fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserHometownToJson(_$_UserHometown instance) =>
    <String, dynamic>{
      'country_name': instance.countryName,
      'city': const _CityNameConverter().toJson(instance.cityName),
    };
