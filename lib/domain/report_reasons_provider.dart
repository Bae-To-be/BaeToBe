import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/data/user_report_reason.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final reportReasonsProvider =
    FutureProvider.autoDispose<List<UserReportReason>>((ref) async {
  final client = ref.read(networkClientProvider);
  final error = ref.read(errorProvider.notifier);
  List<UserReportReason> result = [];
  await error.safelyExecute(
      command: client.get(BackendRoutes.listReportReasons),
      onSuccess: (response) {
        for (var reason in response.data['data']) {
          result.add(UserReportReason.fromJson(reason));
        }
        return Future.value(null);
      });
  ref.maintainState = true;
  return result;
});
