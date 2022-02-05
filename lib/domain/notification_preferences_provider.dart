import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/infrastructure/secure_storage_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationPreferencesProvider =
    StateNotifierProvider<NotificationPreferencesNotifier, bool>(
        (ref) => NotificationPreferencesNotifier(ref));

class NotificationPreferencesNotifier extends StateNotifier<bool> {
  final Ref ref;
  NotificationPreferencesNotifier(this.ref) : super(false) {
    ref
        .read(secureStorageProvider)
        .read(key: StorageKeys.notifyWhileAppOpen)
        .then((value) {
      if (value != null) {
        state = value == 'true';
      }
    });
  }

  void updateWhileAppOpen(bool value) {
    state = value;
    ref
        .read(secureStorageProvider)
        .write(key: StorageKeys.notifyWhileAppOpen, value: state.toString());
  }
}
