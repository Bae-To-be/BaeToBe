import 'package:baetobe/application/theme.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/images_provider.dart';
import 'package:baetobe/entities/view_models/image_form_state.dart';
import 'package:collection/collection.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
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

  Future<void> pickImage(ImageSource imageSource) async {
    final imagesNotifier = ref.read(imagesProvider.notifier);
    final XFile? image = await _picker.pickImage(
        source: imageSource,
        preferredCameraDevice: CameraDevice.front,
        imageQuality:
            FirebaseRemoteConfig.instance.getInt(RemoteConfigs.imageQuality));
    if (image == null) return;
    final croppedImage = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 9, ratioY: 16),
      aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
      androidUiSettings: const AndroidUiSettings(
          showCropGrid: true,
          toolbarWidgetColor: themeColor,
          activeControlsWidgetColor: themeColor,
          cropFrameColor: themeColorLight,
          cropFrameStrokeWidth: 8,
          hideBottomControls: true),
    );
    if (croppedImage == null) return;
    state = state.copyWith(loading: true);
    await imagesNotifier.addImage(
        position, croppedImage.path, 'croppedImage$position');
    if (mounted) {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> removeImage() async {
    if (ref.watch(imagesProvider).length <= 2) {
      ref
          .watch(errorProvider.notifier)
          .updateError(ErrorMessages.cannotDeleteLastNImages);
      return;
    }
    state = state.copyWith(loading: true);
    final imagesNotifier = ref.read(imagesProvider.notifier);
    await imagesNotifier.removeImage(position);
    if (mounted) {
      state = state.copyWith(loading: false);
    }
  }
}
