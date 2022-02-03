import 'package:baetobe/domain/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final heightStateProvider = StateProvider.autoDispose<int?>((ref) {
  int? height;

  final user = ref.watch(userProvider);

  if (user.height != null) {
    height = user.height!;
  }

  return height;
});

final selectedHeightProvider = StateProvider.autoDispose<int>((ref) {
  return -1;
});
