import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/data/preference.dart';
import 'package:baetobe/entities/preferences.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final preferencesProvider = FutureProvider.family
    .autoDispose<List, Preferences>((ref, preferencesHandler) async {
  final error = ref.read(errorProvider.notifier);
  final client = ref.read(networkClientProvider);
  List<Preference> result = [];

  await error.safelyExecute(
      command: client.get(preferencesHandler.backendRoute()),
      onSuccess: (response) {
        for (var preference in response.data['data']) {
          result.add(Preference.fromJson(preference));
        }
        return Future.value(null);
      });
  return result;
});
