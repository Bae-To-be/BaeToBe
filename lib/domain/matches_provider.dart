import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/match.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final matchesProvider =
    StateNotifierProvider<MatchesNotifier, AsyncValue<List<Match>>>((ref) {
  return MatchesNotifier(ref);
});

class MatchesNotifier extends StateNotifier<AsyncValue<List<Match>>>
    with WidgetsBindingObserver {
  int pageNumber = 0;
  final Ref ref;

  MatchesNotifier(this.ref) : super(const AsyncValue.loading()) {
    fetchMatches(1, true)
        .then((_) => WidgetsBinding.instance?.addObserver(this));
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
      fetchMatches(1, false);
    }
  }

  Future<bool> fetchMatches(int? pageOverride, bool updateLoading) async {
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
        command: client.get(BackendRoutes.listMatches,
            queryParameters: {'page': pageNumber}),
        onSuccess: (response) {
          if (response.data['data'].isNotEmpty) {
            gotData = true;
          }
          if (pageNumber == 1) {
            state = AsyncValue.data(response.data['data']
                .map<Match>((matchData) => Match.fromJson(matchData))
                .toList());
          } else {
            for (var matchData in response.data['data']) {
              addOrUpdateMatch(Match.fromJson(matchData));
            }
          }
          return Future.value(null);
        });
    if (state is AsyncLoading) {
      state = const AsyncValue.data([]);
    }
    return gotData;
  }

  void incrementUnreadCount(int matchId, int updatedAt) {
    if (state.value == null) {
      return;
    }

    final existing =
        state.value!.firstWhereOrNull((match) => match.id == matchId);
    if (existing != null) {
      addOrUpdateMatch(existing.copyWith(
          newUnreadCount: existing.unreadCount + 1, newUpdatedAt: updatedAt));
    }
  }

  void markClosed(int matchId, int updatedAt) {
    if (state.value == null) {
      return;
    }

    final existing =
        state.value!.firstWhereOrNull((match) => match.id == matchId);
    if (existing != null) {
      addOrUpdateMatch(
          existing.copyWith(newIsClosed: true, newUpdatedAt: updatedAt));
    }
  }

  void addOrUpdateMatch(Match newMatch) {
    state = AsyncValue.data(List.from(state.value ?? [])
      ..removeWhere((match) => match.id == newMatch.id)
      ..add(newMatch)
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt)));
  }
}
