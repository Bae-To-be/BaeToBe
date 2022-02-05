import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/generated/gender.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenderListing {
  final List<Gender> defaultGenders;
  final List<Gender> allGenders;

  GenderListing({required this.defaultGenders, required this.allGenders});
}

final genderProvider = FutureProvider.autoDispose<GenderListing>((ref) async {
  final error = ref.read(errorProvider.notifier);
  final client = ref.read(networkClientProvider);
  GenderListing result = GenderListing(defaultGenders: [], allGenders: []);

  await error.safelyExecute(
      command: client.get(BackendRoutes.listGenders),
      onSuccess: (response) {
        for (var defaultGender in response.data['data']['default']) {
          result.defaultGenders.add(Gender.fromJson(defaultGender));
        }
        for (var gender in response.data['data']['all']) {
          result.allGenders.add(Gender.fromJson(gender));
        }
        return Future.value(null);
      });
  return result;
});
