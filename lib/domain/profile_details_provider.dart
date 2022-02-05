import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/likes_provider.dart';
import 'package:baetobe/domain/matches_provider.dart';
import 'package:baetobe/entities/data/like.dart';
import 'package:baetobe/entities/user_profile.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileDetailsProvider =
    FutureProvider.autoDispose.family<DetailedProfile?, int>((ref, id) async {
  final client = ref.read(networkClientProvider);
  final error = ref.read(errorProvider.notifier);
  // Reload user if a match is received against him or sent likes change
  ref.watch(matchesProvider.select((result) =>
      result.value?.firstWhereOrNull((match) => match.userId == id)));
  // A like can be removed using a notification, in that case this API will return no user.
  ref.watch(likesProvider(likeDirection.sent).select(
      (result) => result.value?.firstWhereOrNull((like) => like.userId == id)));
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

final isReportedProvider =
    StateProvider.autoDispose.family<bool, int>((ref, id) {
  return ref.watch(profileDetailsProvider(id)
          .select((result) => result.value?.isReported)) ==
      true;
});

final isProfileMatchClosedProvider =
    StateProvider.autoDispose.family<bool, int>((ref, id) {
  return ref.watch(profileDetailsProvider(id)
          .select((result) => result.value?.match?.isClosed)) ==
      true;
});

Future<void> closeMatch(int id, WidgetRef ref) async {
  final client = ref.read(networkClientProvider);
  final error = ref.read(errorProvider.notifier);

  await error.safelyExecute(
      command: client.post(
          BackendRoutes.closeMatch.replaceAll('%{match_id}', id.toString())),
      onSuccess: (response) {
        ref.read(isProfileMatchClosedProvider(id).notifier).state = true;
        return Future.value(null);
      });
}
