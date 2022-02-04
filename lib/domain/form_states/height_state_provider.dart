import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedIndexProvider = StateProvider.autoDispose<int>((ref) {
  return -1;
});
