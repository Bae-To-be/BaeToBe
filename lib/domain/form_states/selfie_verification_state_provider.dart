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

final selfieStateProvider =
    StateNotifierProvider.autoDispose<SelfieFormStateNotifier, SelfieState>(
        (ref) {
  return SelfieFormStateNotifier(ref);
});

class SelfieFormStateNotifier extends StateNotifier<SelfieState>
    with WidgetsBindingObserver {
  CameraDescription? _camera;
  final Ref ref;

  SelfieFormStateNotifier(this.ref) : super(SelfieState()) {
    _setupCamera();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    state.controller?.dispose();
    super.dispose();
  }

  @override
  //ignore: avoid_renaming_method_parameters
  void didChangeAppLifecycleState(AppLifecycleState appState) {
    super.didChangeAppLifecycleState(appState);
    if (state.controller == null ||
        state.controller?.value.isInitialized != true) {
      return;
    }
    if ([AppLifecycleState.inactive, AppLifecycleState.paused]
        .contains(appState)) {
      state.controller?.dispose();
    } else if (appState == AppLifecycleState.resumed) {
      _setupCamera();
    }
  }

  void clearPicture() {
    final newState = state.copyWith();
    newState.file = null;
    debugPrint(newState.toString());
    state = newState;
  }

  Future<void> handleSubmission(bool? redirectBack) {
    if (state.file == null) {
      return _clickPicture();
    } else {
      return _submitSelection(redirectBack);
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

  Future<void> _submitSelection(bool? redirectBack) async {
    if (state.file != null) {
      final loading = ref.read(loadingProvider.notifier);
      loading.state = true;
      if (await ref.read(verificationFilesProvider.notifier).addFile(
          VerificationTypes.selfie, state.file!.path, state.file!.name)) {
        loading.state = false;
        if (redirectBack == true) {
          await ref.read(routerProvider.notifier).pop();
          return;
        }
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
    await state.controller?.dispose();

    final controller = CameraController(_camera!, ResolutionPreset.medium);
    try {
      await controller.initialize();
    } on CameraException {
      error.updateError(ErrorMessages.pleaseGrantCameraPermission);
    }
    state = state.copyWith(newController: controller);
  }
}

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
