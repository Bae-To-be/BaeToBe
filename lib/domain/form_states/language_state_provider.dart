import 'package:baetobe/domain/background_fields/language_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final languageStateProvider = StateProvider.autoDispose<List<int>>((ref) {
  List<int> result = [];
  final user = ref.watch(userProvider);
  final languages = ref.watch(languageProvider);
  if (user.languages.isNotEmpty) {
    languages.whenData((listing) {
      final matches =
          listing.where((language) => user.languages.contains(language.name));
      result = matches.map((language) => language.id).cast<int>().toList();
    });
  }

  return result;
});
