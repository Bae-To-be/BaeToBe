import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../user_provider.dart';

final bioTextProvider = StateProvider.autoDispose<String>((ref) {
  final user = ref.watch(userProvider);

  return user.bio ?? '';
});
