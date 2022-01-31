import 'package:baetobe/domain/background_fields/gender_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final interestedGenderStateProvider =
    StateProvider.autoDispose<List<int>>((ref) {
  List<int> result = [];
  final user = ref.watch(userProvider);
  final genders = ref.watch(genderProvider);
  if (user.interestedGenders.isNotEmpty) {
    genders.whenData((listing) {
      final matches = listing.allGenders
          .where((gender) => user.interestedGenders.contains(gender.name));
      result = matches.map((gender) => gender.id).toList();
    });
  }

  return result;
});
