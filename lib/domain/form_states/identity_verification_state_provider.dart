import 'dart:io';

import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:baetobe/domain/verification_files_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final identityVerificationStateProvider =
    StateNotifierProvider.autoDispose<IdentityFormStateNotifier, IdentityState>(
        (ref) {
  return IdentityFormStateNotifier(ref);
});

class IdentityFormStateNotifier extends StateNotifier<IdentityState> {
  final Ref ref;

  IdentityFormStateNotifier(this.ref) : super(IdentityState()) {
    final identityFile = ref.watch(
        verificationFilesProvider.select((files) => files.getIdentity()));
    if (identityFile != null) {
      state = state.copyWith(newUploaded: true);
    }
  }

  Future<void> pickFile() async {
    final loading = ref.read(loadingProvider.notifier);
    final error = ref.read(errorProvider.notifier);
    File? file;
    state = state.copyWith(newUploading: true);
    loading.state = true;
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf', 'jpeg', 'jpg', 'png', 'doc']);
      if (result != null) {
        file = File(result.files.single.path!);
      } else {
        state = state.copyWith(newUploading: false);
        loading.state = false;
        return;
      }
    } catch (e, stacktrace) {
      state = state.copyWith(newUploading: false);
      loading.state = false;
      await FirebaseCrashlytics.instance.recordError(e, stacktrace);
      error.updateError(ErrorMessages.couldNotPickFile);
      return;
    }
    if (await ref
        .read(verificationFilesProvider.notifier)
        .addFile(VerificationTypes.identity, file.path, null)) {
      loading.state = false;
      return;
    }
    loading.state = false;
    state = state.copyWith(newUploading: false);
  }

  Future<void> clearFile() async {
    if (state.uploaded) {
      final loading = ref.read(loadingProvider.notifier);
      state = state.copyWith(newUploading: true);
      loading.state = true;
      if (await ref
          .read(verificationFilesProvider.notifier)
          .removeFile(VerificationTypes.identity)) {
        loading.state = false;
        return;
      }
      loading.state = false;
      state = state.copyWith(newUploading: false);
    }
  }
}

class IdentityState {
  bool uploaded;
  bool uploading;

  IdentityState({this.uploading = false, this.uploaded = false});

  IdentityState copyWith({bool? newUploading, bool? newUploaded}) {
    return IdentityState(
        uploading: newUploading ?? uploading,
        uploaded: newUploaded ?? uploaded);
  }
}
