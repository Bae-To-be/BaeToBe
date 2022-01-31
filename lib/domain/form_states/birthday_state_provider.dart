import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/utils/datetime.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final birthdayStateProvider = StateProvider.autoDispose<DateTime?>((ref) {
  final user = ref.watch(userProvider);
  DateTime? result;
  if (user.birthday != null) {
    result = onlyDate.parse(user.birthday!);
  }
  return result;
});

final ageProvider = Provider.autoDispose<num?>((ref) {
  final s = ref.watch(birthdayStateProvider);
  if (s == null) {
    return null;
  }

  DateTime currentDate = DateTime.now();
  num result = currentDate.year - s.year;

  if (s.month > currentDate.month) {
    result = result - 1;
  } else if (s.month == currentDate.month) {
    if (s.day > currentDate.day) {
      result = result - 1;
    }
  }
  return result;
});
