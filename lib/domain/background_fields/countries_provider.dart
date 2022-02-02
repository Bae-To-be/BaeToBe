import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countriesProvider = FutureProvider.autoDispose<List>((ref) async {
  List countries = [];
  final error = ref.read(errorProvider.notifier);
  final client = ref.read(networkClientProvider);
  await error.safelyExecute(
      command: client.get(BackendRoutes.listCountries),
      onSuccess: (response) {
        for (var country in response.data['data']) {
          countries.add(country);
        }
        return Future.value();
      });
  return countries;
});
