import 'package:freezed_annotation/freezed_annotation.dart';

part 'matching_preferences_form_state.freezed.dart';

@freezed
class MatchingPreferencesFormState with _$MatchingPreferencesFormState {
  MatchingPreferencesFormState._();

  factory MatchingPreferencesFormState(
      {@Default(0) int searchRadius,
      @Default(0) int interestedInAgeUpper,
      @Default(0) int interestedInAgeLower}) = _MatchingPreferencesFormState;

  double currentRadius() {
    return searchRadius / 1000;
  }
}
