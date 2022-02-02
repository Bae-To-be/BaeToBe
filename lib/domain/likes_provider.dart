import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:baetobe/entities/like.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final likesProvider =
    StateNotifierProvider.family<LikesNotifier, List<Like>, likeDirection>(
        (ref, direction) {
  return LikesNotifier(ref, direction);
});

const likeRouteMap = {
  likeDirection.received: BackendRoutes.listLikesReceived,
  likeDirection.sent: BackendRoutes.listLikesSent
};

class LikesNotifier extends StateNotifier<List<Like>> {
  int pageNumber = 0;

  final Ref ref;
  final likeDirection direction;

  LikesNotifier(this.ref, this.direction) : super([]) {
    fetchLikes(1, true);
  }

  Future<bool> fetchLikes(int? pageOverride, bool updateLoading) async {
    final loading = ref.read(loadingProvider.notifier);
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);

    bool gotData = false;
    int toSend;
    if (pageOverride == null) {
      pageNumber += 1;
      toSend = pageNumber;
    } else {
      toSend = pageOverride;
    }
    if (updateLoading) {
      loading.state = true;
    }
    await error.safelyExecute(
        command: client
            .get(likeRouteMap[direction]!, queryParameters: {'page': toSend}),
        onSuccess: (response) {
          if (response.data['data'].isNotEmpty) {
            gotData = true;
          }
          for (var likeData in response.data['data']) {
            addOrUpdateLike(Like.fromJson(likeData));
          }
          return Future.value(null);
        });
    loading.state = false;
    return gotData;
  }

  void addOrUpdateLike(Like newLike) {
    state = List.from(state)
      ..removeWhere((like) => like.id == newLike.id)
      ..add(newLike);
  }
}
