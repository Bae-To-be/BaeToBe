import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:baetobe/domain/verification_files_provider.dart';
import 'package:camera/camera.dart';
import 'package:collection/collection.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelfieState {
  XFile? file;
  CameraController? controller;

  SelfieState({this.controller, this.file});

  SelfieState copyWith({CameraController? newController, XFile? newFile}) {
    return SelfieState(
        file: newFile ?? file, controller: newController ?? controller);
  }

  @override
  String toString() {
    return {'file': file}.toString();
  }
}

final selfieStateProvider =
    StateNotifierProvider.autoDispose<SelfieFormStateNotifier, SelfieState>(
        (ref) {
  return SelfieFormStateNotifier(ref);
});

class SelfieFormStateNotifier extends StateNotifier<SelfieState> {
  CameraDescription? _camera;
  final Ref ref;

  SelfieFormStateNotifier(this.ref) : super(SelfieState()) {
    _setupCamera();
  }

  @override
  void dispose() {
    state.controller?.dispose();
    super.dispose();
  }

  void clearPicture() {
    final newState = state.copyWith();
    newState.file = null;
    debugPrint(newState.toString());
    state = newState;
  }

  Future<void> handleSubmission() {
    if (state.file == null) {
      return _clickPicture();
    } else {
      return _submitSelection();
    }
  }

  Future<void> _clickPicture() async {
    final error = ref.read(errorProvider.notifier);
    XFile? file;
    try {
      file = await state.controller!.takePicture();
      state = state.copyWith(newFile: file);
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, stacktrace);
      error.updateError(ErrorMessages.couldNotTakePicture);
      return;
    }
  }

  Future<void> _submitSelection() async {
    if (state.file != null) {
      final loading = ref.read(loadingProvider.notifier);
      loading.state = true;
      if (await ref.read(verificationFilesProvider.notifier).addFile(
          VerificationTypes.selfie, state.file!.path, state.file!.name)) {
        loading.state = false;
        await ref
            .read(routerProvider.notifier)
            .pushNamed(AppLinks.identityVerification);
        return;
      }
      loading.state = false;
      clearPicture();
    }
  }

  Future<void> _setupCamera() async {
    final error = ref.read(errorProvider.notifier);
    _camera = (await availableCameras()).firstWhereOrNull(
        (instance) => instance.lensDirection == CameraLensDirection.front);
    if (_camera == null) {
      error.updateError(ErrorMessages.couldNotLoadCamera);
      return;
    }
    final controller = CameraController(_camera!, ResolutionPreset.medium);
    try {
      await controller.initialize();
    } on CameraException {
      error.updateError(ErrorMessages.pleaseGrantCameraPermission);
    }
    state = state.copyWith(newController: controller);
  }
}
