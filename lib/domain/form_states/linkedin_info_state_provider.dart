import 'package:baetobe/domain/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final urlFormat = RegExp('https:\\/\\/[a-z]{2,3}\\.linkedin\\.com\\/.*');

extension LinkedinUrl on String? {
  bool isValidLinkedinUrl() {
    return urlFormat.hasMatch(this ?? '');
  }
}

final linkedinUrlStateProvider = StateProvider.autoDispose<String?>((ref) {
  final user = ref.watch(userProvider);
  return user.linkedInURL;
});

final linkedinPublicStateProvider = StateProvider.autoDispose<bool>((ref) {
  final user = ref.watch(userProvider);
  return user.linkedInPublic ?? false;
});
