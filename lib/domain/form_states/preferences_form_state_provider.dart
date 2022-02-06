import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/data/user.dart';
import 'package:baetobe/entities/view_models/matching_preferences_form_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final matchingPreferencesFormStateProvider = StateNotifierProvider.autoDispose<
    MatchingPreferencesNotifier, MatchingPreferencesFormState>((ref) {
  final user = ref.watch(userProvider);

  return MatchingPreferencesNotifier(ref, user);
});

class MatchingPreferencesNotifier
    extends StateNotifier<MatchingPreferencesFormState> {
  final Ref ref;
  final User user;
  CancelToken? radiusToken;
  CancelToken? ageToken;

  MatchingPreferencesNotifier(this.ref, this.user)
      : super(MatchingPreferencesFormState()) {
    if (user.searchRadius != null) {
      state = state.copyWith(searchRadius: user.searchRadius!);
    }
    if (user.interestedAgeUpper != null) {
      state = state.copyWith(interestedInAgeUpper: user.interestedAgeUpper!);
    }
    if (user.interestedAgeLower != null) {
      state = state.copyWith(interestedInAgeLower: user.interestedAgeLower!);
    }
  }

  void updateAgeRange(RangeValues values) {
    state = state.copyWith(
        interestedInAgeLower: values.start.round(),
        interestedInAgeUpper: values.end.round());
    if (user.interestedAgeLower != state.interestedInAgeLower ||
        user.interestedAgeUpper != state.interestedInAgeUpper) {
      ageToken?.cancel();
      ageToken = CancelToken();
      ref.read(userProvider.notifier).updateAttributes({
        'interested_age_upper': state.interestedInAgeUpper,
        'interested_age_lower': state.interestedInAgeLower
      }, cancelToken: ageToken);
    }
  }

  void updateSearchRadius(double value) {
    state = state.copyWith(searchRadius: (value * 1000).round());
    if (user.searchRadius != state.searchRadius) {
      radiusToken?.cancel();
      radiusToken = CancelToken();
      ref.read(userProvider.notifier).updateAttributes({
        'search_radius': state.searchRadius,
      }, cancelToken: radiusToken);
    }
  }
}
