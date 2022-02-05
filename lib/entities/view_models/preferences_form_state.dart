import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences_form_state.freezed.dart';

@freezed
class PreferencesFormState with _$PreferencesFormState {
  PreferencesFormState._();

  factory PreferencesFormState(
      {@Default(0) int searchRadius,
      @Default(0) int interestedInAgeUpper,
      @Default(0) int interestedInAgeLower}) = _PreferencesFormState;

  double currentRadius() {
    return searchRadius / 1000;
  }
}
