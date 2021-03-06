import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/data/like.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final likesProvider = StateNotifierProvider.family<LikesNotifier,
    AsyncValue<List<Like>>, LikeDirection>((ref, direction) {
  return LikesNotifier(ref, direction);
});

const likeRouteMap = {
  LikeDirection.received: BackendRoutes.listLikesReceived,
  LikeDirection.sent: BackendRoutes.listLikesSent
};

class LikesNotifier extends StateNotifier<AsyncValue<List<Like>>>
    with WidgetsBindingObserver {
  int pageNumber = 0;

  final Ref ref;
  final LikeDirection direction;

  LikesNotifier(this.ref, this.direction) : super(const AsyncValue.loading()) {
    fetchLikes(1, true).then((_) => WidgetsBinding.instance?.addObserver(this));
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  //ignore: avoid_renaming_method_parameters
  void didChangeAppLifecycleState(AppLifecycleState appState) {
    super.didChangeAppLifecycleState(appState);
    if (state is AsyncLoading) {
      return;
    }
    if (appState == AppLifecycleState.resumed) {
      fetchLikes(1, false);
    }
  }

  Future<bool> fetchLikes(int? pageOverride, bool updateLoading) async {
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);

    bool gotData = false;
    if (pageOverride == null) {
      pageNumber += 1;
    } else {
      pageNumber = pageOverride;
    }
    if (updateLoading) {
      state = const AsyncValue.loading();
    }
    await error.safelyExecute(
        command: client.get(likeRouteMap[direction]!,
            queryParameters: {'page': pageNumber}),
        onSuccess: (response) {
          if (response.data['data'].isNotEmpty) {
            gotData = true;
          }
          if (pageNumber == 1) {
            state = AsyncValue.data(response.data['data']
                .map<Like>((likeData) => Like.fromJson(likeData))
                .toList());
          } else {
            for (var likeData in response.data['data']) {
              addOrUpdateLike(Like.fromJson(likeData));
            }
          }
          return Future.value(null);
        });
    if (state is AsyncLoading) {
      state = const AsyncValue.data([]);
    }
    return gotData;
  }

  void addOrUpdateLike(Like newLike) {
    state = AsyncValue.data(List.from(state.value ?? [])
      ..removeWhere((like) => like.id == newLike.id)
      ..add(newLike));
  }

  void removeLikeWithUser(int userID) {
    if (state is AsyncLoading) {
      return;
    }

    state = AsyncValue.data(List.from(state.value ?? [])
      ..removeWhere((like) => like.user.userId == userID));
  }

  void removeLike(int likeId) {
    if (state is AsyncLoading) {
      return;
    }

    state = AsyncValue.data(
        List.from(state.value ?? [])..removeWhere((like) => like.id == likeId));
  }
}
