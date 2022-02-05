import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:baetobe/domain/profile_details_provider.dart';
import 'package:baetobe/entities/view_models/report_user_state.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final reportUserStateProvider = StateNotifierProvider.autoDispose
    .family<ReportUserNotifier, ReportUserState, int>((ref, id) {
  return ReportUserNotifier(ref, id);
});

class ReportUserNotifier extends StateNotifier<ReportUserState> {
  final Ref ref;
  final int userId;
  ReportUserNotifier(this.ref, this.userId) : super(ReportUserState());

  void updateComment(String value) {
    state = state.copyWith(comment: value);
  }

  void updateSelected(int value) {
    state = state.copyWith(selected: value);
  }

  Future<void> submitSelection() async {
    final loading = ref.read(loadingProvider.notifier);
    loading.state = true;
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);
    await error.safelyExecute(
        command: client.post(BackendRoutes.reportUser, data: {
          'user_id': userId,
          'reason_id': state.selected,
          'comment': state.comment
        }),
        onSuccess: (response) {
          loading.state = false;
          ref.read(isReportedProvider(userId).notifier).state = true;
          ref.read(routerProvider.notifier).pop();
          return Future.value(null);
        },
        onError: (_) => loading.state = false);
  }
}
