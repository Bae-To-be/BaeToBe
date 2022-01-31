import 'package:baetobe/domain/images_provider.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageStateProvider = StateNotifierProvider.autoDispose
    .family<ImageStateNotifier, ImageFormState, int>(
        (ref, position) => ImageStateNotifier(ref, position));

class ImageStateNotifier extends StateNotifier<ImageFormState> {
  final Ref ref;
  final int position;
  final ImagePicker _picker = ImagePicker();

  ImageStateNotifier(this.ref, this.position) : super(ImageFormState()) {
    final image = ref.watch(imagesProvider.select((images) =>
        images.firstWhereOrNull((image) => image.position == position)));
    if (image != null) {
      state = ImageFormState(
        url: image.url,
        id: image.id,
      );
    }
  }

  Future<void> pickImage() async {
    final imagesNotifier = ref.read(imagesProvider.notifier);

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      state = state.copyWith(newUploading: true);
      await imagesNotifier.addImage(position, image.path, image.name);
      state = state.copyWith(newUploading: false);
    }
  }

  Future<void> removeImage() async {
    state = state.copyWith(newUploading: true);
    final imagesNotifier = ref.read(imagesProvider.notifier);
    await imagesNotifier.removeImage(position);
    state = state.copyWith(newUploading: false);
  }
}

class ImageFormState {
  String? url;
  int? id;
  bool loading;

  ImageFormState({this.url, this.id, this.loading = false});

  ImageFormState copyWith({
    String? newUrl,
    int? newId,
    bool? newUploading,
  }) {
    return ImageFormState(
      url: newUrl ?? url,
      id: newId ?? id,
      loading: newUploading ?? loading,
    );
  }

  @override
  String toString() {
    return {
      'url': url,
      'uploading': loading,
      'id': id,
    }.toString();
  }
}
