import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/images_provider.dart';
import 'package:baetobe/entities/view_models/image_form_state.dart';
import 'package:collection/collection.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
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

    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality:
            FirebaseRemoteConfig.instance.getInt(RemoteConfigs.imageQuality));
    if (image != null) {
      state = state.copyWith(loading: true);
      await imagesNotifier.addImage(position, image.path, image.name);
      if (mounted) {
        state = state.copyWith(loading: false);
      }
    }
  }

  Future<void> removeImage() async {
    state = state.copyWith(loading: true);
    final imagesNotifier = ref.read(imagesProvider.notifier);
    await imagesNotifier.removeImage(position);
    if (mounted) {
      state = state.copyWith(loading: false);
    }
  }
}
