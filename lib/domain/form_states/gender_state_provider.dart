import 'package:baetobe/domain/background_fields/gender_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final genderStateProvider = StateProvider.autoDispose<List<int>>((ref) {
  List<int> result = [];
  final user = ref.watch(userProvider);
  final genders = ref.watch(genderProvider);
  if (user.gender != null) {
    genders.whenData((listing) {
      final match = listing.allGenders
          .firstWhereOrNull((gender) => gender.name == user.gender);
      if (match != null) {
        result = [match.id];
      }
    });
  }

  return result;
});
