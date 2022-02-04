import 'package:baetobe/domain/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final religionStateProvider = StateProvider.autoDispose<int?>((ref) {
  final user = ref.watch(userProvider);

  return user.religion?.id;
});
