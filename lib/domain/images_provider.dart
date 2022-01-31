import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:baetobe/entities/user.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
}
