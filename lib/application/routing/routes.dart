import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/routing/auth_guard.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/screens/boot/splash_screen.dart';
import 'package:baetobe/screens/help_article_screen.dart';
import 'package:baetobe/screens/home/discover_tab.dart';
import 'package:baetobe/screens/home/likes/likes_received_tab.dart';
import 'package:baetobe/screens/home/likes/likes_sent_tab.dart';
import 'package:baetobe/screens/home/likes_tab.dart';
import 'package:baetobe/screens/home/matches/messages_for_match_screen.dart';
import 'package:baetobe/screens/home/matches_tab.dart';
import 'package:baetobe/screens/home/profile_tab.dart';
import 'package:baetobe/screens/homepage_screen.dart';
import 'package:baetobe/screens/kyc/under_verification_screen.dart';
import 'package:baetobe/screens/kyc/verification_rejected_screen.dart';
import 'package:baetobe/screens/login_screen.dart';
import 'package:baetobe/screens/profile_screens/account_settings_screen.dart';
import 'package:baetobe/screens/profile_screens/edit_profile_page.dart';
import 'package:baetobe/screens/profile_screens/help_page.dart';
import 'package:baetobe/screens/profile_screens/update_matching_preferences_page.dart';
import 'package:baetobe/screens/update_update/education_history_screen.dart';
import 'package:baetobe/screens/update_update/identity_verification_screen.dart';
import 'package:baetobe/screens/update_update/linkedin_url_screen.dart';
import 'package:baetobe/screens/update_update/selfie_verification_screen.dart';
import 'package:baetobe/screens/update_update/update_birthday_screen.dart';
import 'package:baetobe/screens/update_update/update_gender_screen.dart';
import 'package:baetobe/screens/update_update/update_height_screen.dart';
import 'package:baetobe/screens/update_update/update_hometown_screen.dart';
import 'package:baetobe/screens/update_update/update_interested_gender_screen.dart';
import 'package:baetobe/screens/update_update/update_languages_spoken_screen.dart';
import 'package:baetobe/screens/update_update/update_preferences_screen.dart';
import 'package:baetobe/screens/update_update/update_religion_screen.dart';
import 'package:baetobe/screens/update_update/update_work_information_screen.dart';
import 'package:baetobe/screens/update_update/upload_images_screen.dart';
import 'package:baetobe/screens/user_profile/report_user_screen.dart';
import 'package:baetobe/screens/user_profile/user_profile_screen.dart';

@CustomAutoRouter(
  preferRelativeImports: false,
  transitionsBuilder: TransitionsBuilders.fadeIn,
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    CustomRoute(
        initial: true,
        path: AppLinks.splash,
        page: SplashScreen,
        transitionsBuilder: TransitionsBuilders.noTransition),
    CustomRoute(path: AppLinks.login, page: LoginScreen),
    CustomRoute(
        path: AppLinks.updateBirthday,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        page: UpdateBirthdayScreen,
        guards: [AuthGuard]),
    CustomRoute(
        path: AppLinks.updateGender,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        page: UpdateGenderScreen,
        guards: [AuthGuard]),
    CustomRoute(
        path: AppLinks.updateInterestedGenders,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        page: UpdateInterestedGenderScreen,
        guards: [AuthGuard]),
    CustomRoute(
        path: AppLinks.updateWorkDetails,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        page: UpdateWorkInformationScreen,
        guards: [AuthGuard]),
    CustomRoute(
        path: AppLinks.updateEducationHistory,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        page: EducationHistoryScreen,
        guards: [AuthGuard]),
    CustomRoute(
        path: AppLinks.updateLinkedInURL,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        page: LinkedinUrlScreen,
        guards: [AuthGuard]),
    CustomRoute(
        path: AppLinks.updateImages,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        page: UploadImagesScreen,
        guards: [AuthGuard]),
    CustomRoute(
        path: AppLinks.selfieVerification,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        page: SelfieVerificationScreen,
        guards: [AuthGuard]),
    CustomRoute(
        path: AppLinks.identityVerification,
        transitionsBuilder: TransitionsBuilders.slideLeft,
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
        path: AppLinks.messagesForMatchRoute,
        page: MessagesForMatchScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.reportUser, page: ReportUserScreen, guards: [AuthGuard]),
    CustomRoute(
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
        RedirectRoute(path: '*', redirectTo: HomepageTabs.discover),
      ],
    ),
    AutoRoute(
        path: AppLinks.editProfile, page: EditProfilePage, guards: [AuthGuard]),
    AutoRoute(path: AppLinks.helpPage, page: EmptyRouterPage, children: [
      AutoRoute(path: '', page: HelpPage, initial: true),
      AutoRoute(path: ':id', page: HelpArticleScreen),
    ], guards: [
      AuthGuard
    ]),
    CustomRoute(
        path: AppLinks.updatePreferences,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        page: UpdatePreferencesScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.updateMatchingPreferences,
        page: UpdateMatchingPreferences,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.editLanguage,
        page: UpdateLanguagesSpokenScreen,
        guards: [AuthGuard]),
    AutoRoute(
        path: AppLinks.accountSettings,
        page: AccountSettingsScreen,
        guards: [AuthGuard]),
    CustomRoute(
        path: AppLinks.editHometown,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        page: UpdateHometownScreen,
        guards: [AuthGuard]),
    CustomRoute(
        path: AppLinks.editReligion,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        page: UpdateReligionScreen,
        guards: [AuthGuard]),
    CustomRoute(
        path: AppLinks.editHeight,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        page: UpdateHeightScreen,
        guards: [AuthGuard]),
    RedirectRoute(path: '*', redirectTo: AppLinks.login),
  ],
)
class $AppRouter {}
