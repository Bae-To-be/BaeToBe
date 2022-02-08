import 'package:baetobe/screens/update_update/update_preferences_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final preferencesStateProvider = StateProvider.family
    .autoDispose<int?, Preferences>((ref, preferencesHandler) {
  return preferencesHandler.userSelectedValue();
});
