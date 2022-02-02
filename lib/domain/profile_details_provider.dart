import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/user_profile.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileDetailsProvider =
    FutureProvider.autoDispose.family<DetailedProfile?, int>((ref, id) async {
  final client = ref.read(networkClientProvider);
  final error = ref.read(errorProvider.notifier);
  DetailedProfile? result;
  await error.safelyExecute(
      command: client
          .get(BackendRoutes.userProfile.replaceAll('%{id}', id.toString())),
      onSuccess: (response) {
        result = DetailedProfile.fromJson(response.data['data']);
        return Future.value(null);
      });
  return result;
});
