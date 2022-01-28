import 'package:auto_route/auto_route.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/screens/home/discover_tab.dart';
import 'package:baetobe/screens/home/likes_tab.dart';
import 'package:baetobe/screens/home/matches_tab.dart';
import 'package:baetobe/screens/home/profile_tab.dart';
import 'package:baetobe/screens/homepage_screen.dart';
import 'package:baetobe/screens/login_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: AppLinks.login,
      page: LoginScreen,
    ),
    //user routes with a nested router
    AutoRoute(
      path: AppLinks.homePage,
      page: HomepageScreen,
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
