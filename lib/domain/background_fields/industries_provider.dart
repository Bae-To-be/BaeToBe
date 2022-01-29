import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/industry.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final industriesProvider =
    FutureProvider.autoDispose<List<Industry>>((ref) async {
  List<Industry> result = [];
  final error = ref.read(errorProvider.notifier);
  final client = ref.read(networkClientProvider);
  await error.safelyExecute(
      command: client.get(BackendRoutes.listIndustries),
      onSuccess: (response) {
        for (var industry in response.data['data']) {
          result.add(Industry.fromJson(industry));
        }
        return Future.value();
      });
  return result;
});
