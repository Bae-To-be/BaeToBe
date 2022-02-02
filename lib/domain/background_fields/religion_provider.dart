import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/religion.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReligionListing {
  final List<Religion> religions;

  ReligionListing({required this.religions});
}

final religionProvider =
    FutureProvider.autoDispose<ReligionListing>((ref) async {
  final error = ref.read(errorProvider.notifier);
  final client = ref.read(networkClientProvider);
  ReligionListing result = ReligionListing(religions: []);

  await error.safelyExecute(
      command: client.get(BackendRoutes.listReligions),
      onSuccess: (response) {
        for (var religion in response.data['data']) {
          result.religions.add(Religion.fromJson(religion));
        }
        return Future.value(null);
      });
  return result;
});
