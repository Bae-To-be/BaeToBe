import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:baetobe/domain/verification_info_provider.dart';
import 'package:baetobe/entities/user.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension FileGetters on List<UserVerificationFile> {
  UserVerificationFile? getSelfie() {
    return firstWhereOrNull(
        (verification) => verification.fileType == VerificationTypes.selfie);
  }

  UserVerificationFile? getIdentity() {
    return firstWhereOrNull(
        (verification) => verification.fileType == VerificationTypes.identity);
  }
}

final verificationFilesProvider = StateNotifierProvider<
    VerificationFilesNotifier, List<UserVerificationFile>>((ref) {
  return VerificationFilesNotifier(ref);
});

class VerificationFilesNotifier
    extends StateNotifier<List<UserVerificationFile>> {
  final Ref ref;

  List<UserVerificationFile> get files => state;

  VerificationFilesNotifier(this.ref)
      : super(List<UserVerificationFile>.empty());

  Future<void> loadFiles() async {
    final loading = ref.read(loadingProvider.notifier);
    loading.state = true;
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);
    await error.safelyExecute(
        command: client.get(BackendRoutes.listVerificationFiles),
        onSuccess: (response) {
          List<UserVerificationFile> newState = [];
          for (var fileData
              in List<Map<String, dynamic>>.from(response.data['data'] ?? [])) {
            newState.add(UserVerificationFile.fromJson(fileData));
          }
          state = newState;
          return Future.value(null);
        });
    loading.state = false;
  }

  Future<bool> addFile(
      String fileType, String filePath, String? filename) async {
    bool result = false;
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);
    await error.safelyExecute(
        command: client.post(BackendRoutes.uploadVerificationFile,
            data: FormData.fromMap({
              'file_type': fileType,
              'file': await MultipartFile.fromFile(
                filePath,
                filename: filename,
              )
            })),
        onSuccess: (response) async {
          result = true;
          _addOrReplaceFile(
              response.data['data']['file_type'], response.data['data']['url']);
          if (ref.read(verificationInfoProvider.notifier).info?.status ==
              ApprovalStatuses.rejected) {
            await ref.read(verificationInfoProvider.notifier).loadInfo();
          }
          return;
        });
    return result;
  }

  Future<bool> removeFile(String fileType) async {
    bool result = false;
    final matchIndex = state.indexWhere((image) => image.fileType == fileType);
    if (matchIndex != -1) {
      final client = ref.read(networkClientProvider);
      final error = ref.read(errorProvider.notifier);
      await error.safelyExecute(
          command: client.delete(BackendRoutes.deleteVerificationFile
              .replaceAll('%{file_type}', fileType)),
          onSuccess: (response) {
            result = true;
            state = List.from(state)..removeAt(matchIndex);
            return Future.value(null);
          });
    }
    return result;
  }

  void _addOrReplaceFile(String verificationType, String url) {
    final newVerificationFile = UserVerificationFile(verificationType, url);
    final matchIndex =
        state.indexWhere((image) => image.fileType == verificationType);
    if (matchIndex == -1) {
      state = [...state, newVerificationFile];
      return;
    }
    state = List.from(state)
      ..removeAt(matchIndex)
      ..insert(matchIndex, newVerificationFile);
  }
}
