import 'package:baetobe/domain/background_fields/religion_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final religionStateProvider = StateProvider.autoDispose<int?>((ref) {
  int? result;
  final user = ref.watch(userProvider);
  final religions = ref.watch(religionProvider);
  if (user.religion != null) {
    religions.whenData((listing) {
      final match = listing
          .firstWhereOrNull((religion) => religion.name == user.religion?.name);
      if (match != null) {
        result = match.id;
      }
    });
  }

  return result;
});
