import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final preferencesStateProvider = StateProvider.family
    .autoDispose<int?, Preferences>((ref, preferencesHandler) {
  final user = ref.watch(userProvider);
  return preferencesHandler.userSelectedValue(user);
});
