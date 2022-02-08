import 'package:baetobe/domain/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bioTextProvider = StateProvider.autoDispose<String>((ref) {
  final user = ref.watch(userProvider);

  return user.bio ?? '';
});
