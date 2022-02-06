import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/data/language.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final languageProvider = FutureProvider.autoDispose<List>((ref) async {
  final error = ref.read(errorProvider.notifier);
  final client = ref.read(networkClientProvider);
  List result = [];

  await error.safelyExecute(
      command: client.get(BackendRoutes.listLanguages),
      onSuccess: (response) {
        for (var language in response.data['data']) {
          result.add(Language.fromJson(language));
        }
        return Future.value(null);
      });
  return result;
});
