import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/routing/auth_guard.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/screens/boot/splash_screen.dart';
import 'package:baetobe/screens/home/discover_tab.dart';
import 'package:baetobe/screens/home/likes_tab.dart';
import 'package:baetobe/screens/home/matches_tab.dart';
import 'package:baetobe/screens/home/profile_tab.dart';
import 'package:baetobe/screens/homepage_screen.dart';
import 'package:baetobe/screens/login_screen.dart';
import 'package:baetobe/screens/user_update/education_history_screen.dart';
import 'package:baetobe/screens/user_update/linkedin_url_screen.dart';
import 'package:baetobe/screens/user_update/update_birthday_screen.dart';
import 'package:baetobe/screens/user_update/update_gender_screen.dart';
import 'package:baetobe/screens/user_update/update_interested_gender_screen.dart';
import 'package:baetobe/screens/user_update/update_work_information_screen.dart';

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
    //user routes with a nested router
    AutoRoute(
      path: AppLinks.homePage,
      page: HomepageScreen,
      guards: [AuthGuard],
      children: [
        AutoRoute(path: HomepageTabs.discover, page: DiscoverTab),
        AutoRoute(path: HomepageTabs.likes, page: LikesTab),
        AutoRoute(path: HomepageTabs.matches, page: MatchesTab),
        AutoRoute(path: HomepageTabs.profile, page: ProfileTab),
        // redirect all other paths
        RedirectRoute(path: '*', redirectTo: HomepageTabs.discover),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: AppLinks.login),
  ],
)
class $AppRouter {}
