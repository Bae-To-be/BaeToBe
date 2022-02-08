import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedIndexProvider = StateProvider.autoDispose<int>((ref) {
  int index = 12;

  final user = ref.watch(userProvider);

  final heightLowerBound =
      FirebaseRemoteConfig.instance.getInt(RemoteConfigs.heightLowerBound);

  if (user.height != null) {
    index = (user.height! / 2.54).round() - (heightLowerBound * 12);
  }

  return index;
});
