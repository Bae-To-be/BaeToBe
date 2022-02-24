import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/likes_provider.dart';
import 'package:baetobe/domain/matches_provider.dart';
import 'package:baetobe/entities/data/like.dart';
import 'package:baetobe/entities/data/match.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> swipe(String direction, int id, WidgetRef ref) async {
  final client = ref.read(networkClientProvider);
  final error = ref.read(errorProvider.notifier);

  await error.safelyExecute(
      command: client.post(BackendRoutes.swipe,
          data: {'direction': direction, 'user_id': id}),
      onError: (response) {},
      onSuccess: (response) {
        final Match match = Match.fromJson(response.data['data']['match']);

        if (response.data['data']['match'] != null) {
          ref.read(matchesProvider.notifier).addOrUpdateMatch(match);
        }

        ref
            .read(likesProvider(LikeDirection.received).notifier)
            .removeLikeWithUser(match.matchedUser.userId);
        ref.read(routerProvider).pop();
        return Future.value(null);
      });
}
