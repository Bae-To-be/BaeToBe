import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:baetobe/domain/verification_files_provider.dart';
import 'package:camera/camera.dart';
import 'package:collection/collection.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelfieState {
  String? url;
  bool uploading;
  CameraController? controller;

  SelfieState({this.url, this.uploading = false, this.controller});

  SelfieState copyWith(
      {String? newUrl, bool? newUploading, CameraController? newController}) {
    return SelfieState(
        url: newUrl ?? url,
        uploading: newUploading ?? uploading,
        controller: newController ?? controller);
  }

  @override
  String toString() {
    return {'url': url, 'uploading': uploading}.toString();
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
    final existing = ref.watch(verificationFilesProvider).getSelfie();
    if (existing != null) {
      state = SelfieState(url: existing.url);
    }
    _setupCamera();
  }

  @override
  void dispose() {
    state.controller?.dispose();
    super.dispose();
  }

  // ignore: avoid_void_async
  Future<void> clickPicture() async {
    state = state.copyWith(newUploading: true);
    final loading = ref.read(loadingProvider.notifier);
    final error = ref.read(errorProvider.notifier);
    loading.state = true;
    XFile? file;
    try {
      file = await state.controller!.takePicture();
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, stacktrace);
      error.updateError(ErrorMessages.couldNotTakePicture);
      state = state.copyWith(newUploading: false);
      loading.state = false;
      return;
    }
    await ref
        .read(verificationFilesProvider.notifier)
        .addFile(VerificationTypes.selfie, file.path, file.name);
    loading.state = false;
  }

  // ignore: avoid_void_async
  void clearPicture() async {
    if (state.url != null) {
      state = state.copyWith(newUploading: true);
      final loading = ref.read(loadingProvider.notifier);
      loading.state = true;
      await ref
          .read(verificationFilesProvider.notifier)
          .removeFile(VerificationTypes.selfie);
      loading.state = false;
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
