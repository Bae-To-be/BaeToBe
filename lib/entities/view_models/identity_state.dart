import 'package:freezed_annotation/freezed_annotation.dart';

part 'identity_state.freezed.dart';

@freezed
class IdentityState with _$IdentityState {
  factory IdentityState({
    @Default(false) bool uploaded,
    @Default(false) bool uploading,
    String? fileName,
  }) = _IdentityState;
}
