import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/view_models/hometown_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final hometownStateProvider = StateProvider.autoDispose<HometownState>((ref) {
  var result = HometownState();
  final user = ref.watch(userProvider);

  if (user.hometown.cityName != '') {
    result = result.copyWith(cityName: user.hometown.cityName);
  }
  if (user.hometown.countryName != '') {
    result = result.copyWith(countryName: user.hometown.countryName);
  }
  return result;
});
