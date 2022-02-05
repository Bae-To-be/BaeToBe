import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:baetobe/entities/generated/user_verification_info.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final verificationInfoProvider =
    StateNotifierProvider<VerificationInfoNotifier, UserVerificationInfo?>(
        (ref) {
  return VerificationInfoNotifier(ref);
});

class VerificationInfoNotifier extends StateNotifier<UserVerificationInfo?> {
  final Ref ref;

  VerificationInfoNotifier(this.ref) : super(null);

  UserVerificationInfo? get info => state;

  Future<void> loadInfo() async {
    final loading = ref.read(loadingProvider.notifier);
    loading.state = true;
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);
    await error.safelyExecute(
        command: client.get(BackendRoutes.verificationInfo),
        onSuccess: (response) {
          state = response.data['data'] == null
              ? null
              : UserVerificationInfo.fromJson(response.data['data']);
          return Future.value(null);
        });
    loading.state = false;
  }
}
