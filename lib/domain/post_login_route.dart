import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/domain/images_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/domain/verification_files_provider.dart';
import 'package:baetobe/domain/verification_info_provider.dart';
import 'package:baetobe/entities/user.dart';

Future<String> postLoginRoute(ref) async {
  final UserNotifier userNotifier = ref.read(userProvider.notifier);
  final ImagesNotifier imagesNotifier = ref.read(imagesProvider.notifier);
  final VerificationFilesNotifier verificationNotifier =
      ref.read(verificationFilesProvider.notifier);
  final VerificationInfoNotifier verificationInfoNotifier =
      ref.read(verificationInfoProvider.notifier);

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
  if (!imagesNotifier.images.hasMinimumRequired()) {
    return AppLinks.updateImages;
  }

  await verificationNotifier.loadFiles();
  if (verificationNotifier.files.getSelfie() == null) {
    return AppLinks.selfieVerification;
  }
  if (verificationNotifier.files.getIdentity() == null) {
    return AppLinks.identityVerification;
  }

  final info = await verificationInfoNotifier.getLatestInfo();
  switch (info?.status) {
    case ApprovalStatuses.approved:
      return AppLinks.homePage;
    case ApprovalStatuses.rejected:
      return AppLinks.verificationRejected;
    default:
      return AppLinks.underVerification;
  }
}
