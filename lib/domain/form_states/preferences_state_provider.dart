import 'package:hooks_riverpod/hooks_riverpod.dart';

final preferencesStateProvider =
    StateProvider.family.autoDispose<int?, int?>((ref, userSelectedValue) {
  return userSelectedValue;
});
