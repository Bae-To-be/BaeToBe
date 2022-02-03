import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/routing/auth_guard.dart';
import 'package:baetobe/components/webview.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/screens/boot/splash_screen.dart';
import 'package:baetobe/screens/home/discover_tab.dart';
import 'package:baetobe/screens/home/likes/likes_received_tab.dart';
import 'package:baetobe/screens/home/likes/likes_sent_tab.dart';
import 'package:baetobe/screens/home/likes_tab.dart';
import 'package:baetobe/screens/home/matches_tab.dart';
import 'package:baetobe/screens/home/profile_tab.dart';
import 'package:baetobe/screens/homepage_screen.dart';
import 'package:baetobe/screens/kyc/under_verification_screen.dart';
import 'package:baetobe/screens/kyc/verification_rejected_screen.dart';
import 'package:baetobe/screens/login_screen.dart';
import 'package:baetobe/screens/profile_screens/edit_profile_page.dart';
import 'package:baetobe/screens/profile_screens/help_page.dart';
import 'package:baetobe/screens/profile_screens/update_preferences_page.dart';
import 'package:baetobe/screens/update_update/education_history_screen.dart';
import 'package:baetobe/screens/update_update/identity_verification_screen.dart';
import 'package:baetobe/screens/update_update/linkedin_url_screen.dart';
import 'package:baetobe/screens/update_update/selfie_verification_screen.dart';
import 'package:baetobe/screens/update_update/update_birthday_screen.dart';
import 'package:baetobe/screens/update_update/update_gender_screen.dart';
import 'package:baetobe/screens/update_update/update_height_screen.dart';
import 'package:baetobe/screens/update_update/update_hometown_screen.dart';
import 'package:baetobe/screens/update_update/update_interested_gender_screen.dart';
import 'package:baetobe/screens/update_update/update_religion_screen.dart';
import 'package:baetobe/screens/update_update/update_work_information_screen.dart';
import 'package:baetobe/screens/update_update/upload_images_screen.dart';
import 'package:baetobe/screens/user_profile/report_user_screen.dart';
import 'package:baetobe/screens/user_profile/user_profile_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(initial: true, path: AppLinks.splash, page: SplashScreen),
    AutoRoute(
      path: AppLinks.login,
      page: LoginScreen,
    ),
    AutoRoute(
        path: AppLinks.updateBirthday,
        page: UpdateBirthdayScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.updateGender,
        page: UpdateGenderScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.updateInterestedGenders,
        page: UpdateInterestedGenderScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.updateWorkDetails,
        page: UpdateWorkInformationScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.updateEducationHistory,
        page: EducationHistoryScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.updateLinkedInURL,
        page: LinkedinUrlScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.updateImages,
        page: UploadImagesScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.selfieVerification,
        page: SelfieVerificationScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.identityVerification,
        page: IdentityVerificationScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.underVerification,
        page: UnderVerificationScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.verificationRejected,
        page: VerificationRejectedScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.profileDetailsRoute,
        page: UserProfileScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.reportUser, page: ReportUserScreen, guards: [AuthGuard]),
    AutoRoute(
      path: AppLinks.homePage,
      page: HomepageScreen,
      guards: [AuthGuard],
      children: [
        AutoRoute(path: HomepageTabs.discover, page: DiscoverTab),
        AutoRoute(path: HomepageTabs.likes, page: LikesTab, children: [
          AutoRoute(path: LikePageTabs.received, page: LikesReceivedTab),
          AutoRoute(path: LikePageTabs.sent, page: LikesSentTab),
          RedirectRoute(path: '*', redirectTo: LikePageTabs.received),
        ]),
        AutoRoute(path: HomepageTabs.matches, page: MatchesTab),
        AutoRoute(path: HomepageTabs.profile, page: ProfileTab),
        // redirect all other paths
        RedirectRoute(path: '*', redirectTo: HomepageTabs.discover),
      ],
    ),
    AutoRoute(
        path: AppLinks.editProfile, page: EditProfilePage, guards: [AuthGuard]),
    AutoRoute(path: AppLinks.helpPage, page: EmptyRouterPage, children: [
      AutoRoute(path: '', page: HelpPage, initial: true),
      AutoRoute(path: AppLinks.webview, page: Webview),
    ], guards: [
      AuthGuard
    ]),
    AutoRoute(
        path: AppLinks.updatePreferences,
        page: UpdatePreferences,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.editHometown,
        page: UpdateHometownScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.editReligion,
        page: UpdateReligionScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.editHeight,
        page: UpdateHeightScreen,
        guards: [AuthGuard]),
    RedirectRoute(path: '*', redirectTo: AppLinks.login),
  ],
)
class $AppRouter {}
