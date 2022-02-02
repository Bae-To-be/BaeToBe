import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../user_provider.dart';

class HometownState {
  String? countryName;
  String? cityName;

  HometownState({this.countryName, this.cityName});

  @override
  bool operator ==(other) {
    return other is HometownState &&
        (other.countryName == countryName) &&
        (other.cityName == cityName);
  }

  @override
  int get hashCode => hashValues(countryName.hashCode, cityName.hashCode);

  @override
  String toString() {
    return {
      'country_name': countryName,
      'city_name': cityName,
    }.toString();
  }

  HometownState copyWith({String? newCountryName, String? newCityName}) {
    return HometownState(
        countryName: newCountryName ?? countryName,
        cityName: newCityName ?? cityName);
  }
}

final hometownStateProvider = StateProvider.autoDispose<HometownState>((ref) {
  final result = HometownState();
  final user = ref.watch(userProvider);

  if (user.hometown.cityName != '') {
    result.cityName = user.hometown.cityName;
  }
  if (user.hometown.countryName != '') {
    result.countryName = user.hometown.countryName;
  }
  return result;
});
