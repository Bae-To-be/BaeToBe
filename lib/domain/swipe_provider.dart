import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/likes_provider.dart';
import 'package:baetobe/domain/matches_provider.dart';
import 'package:baetobe/entities/data/like.dart';
import 'package:baetobe/entities/data/match.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> swipe(String direction, int id, WidgetRef ref, int? likeID) async {
  final client = ref.read(networkClientProvider);
  final error = ref.read(errorProvider.notifier);

  await error.safelyExecute(
      command: client.post(BackendRoutes.swipe,
          data: {'direction': direction, 'user_id': id}),
      onError: (response) {},
      onSuccess: (response) {
        if (response.data['data']['match'] != null) {
          ref
              .read(likesProvider(LikeDirection.received).notifier)
              .removeLike(likeID!);
          ref
              .read(matchesProvider.notifier)
              .addOrUpdateMatch(Match.fromJson(response.data['data']['match']));
          ref.read(routerProvider).pop();
          return Future.value(null);
        }
        ref
            .read(likesProvider(LikeDirection.received).notifier)
            .removeLike(likeID!);
        ref.read(routerProvider).pop();
        return Future.value(null);
      });
}
