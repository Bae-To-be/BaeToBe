import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/domain/user_provider.dart';

Future<String> postLoginRoute(ref) async {
  final userNotifier = ref.read(userProvider.notifier);
  await userNotifier.loadUser();
  if (userNotifier.user.birthday != null) {
    return AppLinks.updateBirthday;
  }
  if (userNotifier.user.gender == null) {
    return AppLinks.updateGender;
  }
  return AppLinks.homePage;
}
