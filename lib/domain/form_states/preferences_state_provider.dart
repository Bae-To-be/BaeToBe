import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final preferencesStateProvider =
    StateProvider.family.autoDispose<int?, String>((ref, preferenceFor) {
  final user = ref.watch(userProvider);

  switch (preferenceFor) {
    case PreferenceKey.drinking:
      return user.drinking?.id;
    case PreferenceKey.smoking:
      return user.smoking?.id;
    case PreferenceKey.children:
      return user.children?.id;
    case PreferenceKey.food:
      return user.food?.id;
    default:
      return null;
  }
});
