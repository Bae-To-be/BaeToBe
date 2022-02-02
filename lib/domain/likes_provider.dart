import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/like.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final likesProvider = StateNotifierProvider.family<LikesNotifier,
    AsyncValue<List<Like>>, likeDirection>((ref, direction) {
  return LikesNotifier(ref, direction);
});

const likeRouteMap = {
  likeDirection.received: BackendRoutes.listLikesReceived,
  likeDirection.sent: BackendRoutes.listLikesSent
};

class LikesNotifier extends StateNotifier<AsyncValue<List<Like>>>
    with WidgetsBindingObserver {
  int pageNumber = 0;

  final Ref ref;
  final likeDirection direction;

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
      fetchLikes(1, true);
    }
  }

  Future<bool> fetchLikes(int? pageOverride, bool initialLoading) async {
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
    if (initialLoading) {
      state = const AsyncValue.loading();
    }
    await error.safelyExecute(
        command: client
            .get(likeRouteMap[direction]!, queryParameters: {'page': toSend}),
        onSuccess: (response) {
          if (response.data['data'].isNotEmpty) {
            gotData = true;
          }
          if (initialLoading) {
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

  void removeLike(int likeId) {
    if (state is AsyncLoading) {
      return;
    }

    state = AsyncValue.data(
        List.from(state.value ?? [])..removeWhere((like) => like.id == likeId));
  }
}
