import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/domain/images_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/user.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

Future<String> postLoginRoute(ref) async {
  final UserNotifier userNotifier = ref.read(userProvider.notifier);
  final ImagesNotifier imagesNotifier = ref.read(imagesProvider.notifier);

  await userNotifier.loadUser();
  final User? user = userNotifier.user;
  if (user == null) {
    return AppLinks.login;
  }

  if (user.birthday == null) {
    return AppLinks.updateBirthday;
  }
  if (user.gender == null) {
    return AppLinks.updateGender;
  }
  if (user.interestedGenders.isEmpty) {
    return AppLinks.updateInterestedGenders;
  }
  if (!user.workInformationPresent()) {
    return AppLinks.updateWorkDetails;
  }
  if (user.education.isEmpty) {
    return AppLinks.updateEducationHistory;
  }
  if (user.linkedInURL == null) {
    return AppLinks.updateLinkedInURL;
  }
  await imagesNotifier.loadImages();
  if (imagesNotifier.images.length <
      FirebaseRemoteConfig.instance.getInt(RemoteConfigs.minPhotoCount)) {
    return AppLinks.updateImages;
  }
  return AppLinks.homePage;
}
