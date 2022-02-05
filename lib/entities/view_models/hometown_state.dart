import 'package:freezed_annotation/freezed_annotation.dart';

part 'hometown_state.freezed.dart';

@freezed
class HometownState with _$HometownState {
  factory HometownState({
    String? countryName,
    String? cityName,
  }) = _HometownState;
}
