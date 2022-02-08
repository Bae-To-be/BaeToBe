import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final preferencesStateProvider =
    StateProvider.family.autoDispose<int?, int?>((ref, userSelectedValue) {
  return userSelectedValue;
});
