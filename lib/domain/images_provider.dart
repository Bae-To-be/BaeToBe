import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:baetobe/entities/user.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension UserImageExt on List<UserImage> {
  bool hasMinimumRequired() {
    return length >=
        FirebaseRemoteConfig.instance.getInt(RemoteConfigs.minPhotoCount);
  }

  UserImage? profilePicture() {
    if (isEmpty) {
      return null;
    }
    return reduce((curr, next) => curr.position < next.position ? curr : next);
  }
}

final imagesProvider =
    StateNotifierProvider<ImagesNotifier, List<UserImage>>((ref) {
  return ImagesNotifier(ref);
});

class ImagesNotifier extends StateNotifier<List<UserImage>> {
  final Ref ref;

  ImagesNotifier(this.ref) : super(List<UserImage>.empty());

  List<UserImage> get images => state;

  Future<void> loadImages() async {
    final loading = ref.read(loadingProvider.notifier);
    loading.state = true;
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);
    await error.safelyExecute(
        command: client.get(BackendRoutes.listImages),
        onSuccess: (response) {
          List<UserImage> newState = [];
          for (var imageData
              in List<Map<String, dynamic>>.from(response.data['data'] ?? [])) {
            newState.add(UserImage.fromJson(imageData));
          }
          state = newState;
          return Future.value(null);
        });
    loading.state = false;
  }

  Future<void> addImage(int index, String filePath, String filename) async {
    final client = ref.read(networkClientProvider);
    final error = ref.read(errorProvider.notifier);
    await error.safelyExecute(
        command: client.post(BackendRoutes.uploadImage,
            data: FormData.fromMap({
              'position': index,
              'image': await MultipartFile.fromFile(
                filePath,
                filename: filename,
              )
            })),
        onSuccess: (response) {
          _addOrReplaceImage(
              response.data['data']['id'] as int,
              response.data['data']['position'] as int,
              response.data['data']['url']);
          return Future.value(null);
        });
  }

  Future<void> removeImage(int position) async {
    final matchIndex = state.indexWhere((image) => image.position == position);
    if (matchIndex != -1) {
      final client = ref.read(networkClientProvider);
      final error = ref.read(errorProvider.notifier);
      await error.safelyExecute(
          command: client.delete(BackendRoutes.deleteImage
              .replaceAll('%{position}', position.toString())),
          onSuccess: (response) {
            state = List.from(state)..removeAt(matchIndex);
            return Future.value(null);
          });
    }
  }

  void _addOrReplaceImage(int id, int position, String url) {
    final newImage = UserImage(id, position, url);
    final matchIndex = state.indexWhere((image) => image.position == position);
    if (matchIndex == -1) {
      state = [...state, newImage];
      return;
    }
    state = List.from(state)
      ..removeAt(matchIndex)
      ..insert(matchIndex, newImage);
  }
}
