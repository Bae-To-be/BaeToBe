import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/generated/religion.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final religionProvider = FutureProvider.autoDispose<List>((ref) async {
  final error = ref.read(errorProvider.notifier);
  final client = ref.read(networkClientProvider);
  List result = [];

  await error.safelyExecute(
      command: client.get(BackendRoutes.listReligions),
      onSuccess: (response) {
        for (var religion in response.data['data']) {
          result.add(Religion.fromJson(religion));
        }
        return Future.value(null);
      });
  return result;
});
