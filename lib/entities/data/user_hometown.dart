import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_hometown.freezed.dart';
part 'user_hometown.g.dart';

@freezed
class UserHometown with _$UserHometown {
  UserHometown._();

  factory UserHometown(
      {@Default('')
      @JsonKey(name: 'country_name')
          String countryName,
      @Default('')
      @_CityNameConverter()
      @JsonKey(name: 'city')
          String cityName}) = _UserHometown;

  factory UserHometown.fromJson(Map<String, dynamic> json) =>
      _$UserHometownFromJson(json);

  String formatted() {
    if (cityName != '' && countryName != '') {
      return '$cityName, $countryName';
    }
    return '$cityName$countryName';
  }
}

class _CityNameConverter extends JsonConverter<String, Map<String, dynamic>> {
  const _CityNameConverter();

  @override
  String fromJson(Map<String, dynamic> json) => json['name'] as String;

  @override
  Map<String, dynamic> toJson(String object) => {
        'name': {object}
      };
}
