import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selfie_state.freezed.dart';

@freezed
class SelfieState with _$SelfieState {
  factory SelfieState({
    XFile? file,
    CameraController? controller,
  }) = _SelfieState;
}
