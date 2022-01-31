import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/images_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImageFormState {
  String? url;
  int? id;
  bool uploading;

  ImageFormState({this.url, this.id, this.uploading = false});

  ImageFormState copyWith({
    String? newUrl,
    int? newId,
    bool? newUploading,
  }) {
    return ImageFormState(
      url: newUrl ?? url,
      id: newId ?? id,
      uploading: newUploading ?? uploading,
    );
  }

  @override
  String toString() {
    return {
      'url': url,
      'uploading': uploading,
      'id': id,
    }.toString();
  }
}

final imagesStateProvider = StateNotifierProvider.autoDispose<
    ImageFormStateNotifier, Map<int, ImageFormState>>((ref) {
  return ImageFormStateNotifier(ref);
});

class ImageFormStateNotifier extends StateNotifier<Map<int, ImageFormState>> {
  final Ref ref;
  final ImagePicker _picker = ImagePicker();

  ImageFormStateNotifier(this.ref) : super({}) {
    final images = ref.watch(imagesProvider);
    Map<int, ImageFormState> newState = {};
    for (var image in images) {
      newState[image.position] = ImageFormState(
        url: image.url,
        id: image.id,
      );
    }
    for (var requiredIndex in Iterable<int>.generate(
        FirebaseRemoteConfig.instance.getInt(RemoteConfigs.maxPhotoCount))) {
      final existing = newState[requiredIndex];
      if (existing == null) {
        newState[requiredIndex] = ImageFormState();
      }
    }
    state = newState;
  }

  Future<void> pickImage(int index) async {
    final imagesNotifier = ref.read(imagesProvider.notifier);

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _toggleLoadingFor(index, true);
      await imagesNotifier.addImage(index, image.path, image.name);
      _toggleLoadingFor(index, false);
    }
  }

  Future<void> removeImage(int index) async {
    _toggleLoadingFor(index, false);
    final imagesNotifier = ref.read(imagesProvider.notifier);
    await imagesNotifier.removeImage(index);
    _toggleLoadingFor(index, false);
  }

  void _toggleLoadingFor(int index, bool uploading) {
    final newImageState = state[index]!.copyWith(newUploading: uploading);
    state = Map.from(state)..update(index, (value) => newImageState);
  }
}
