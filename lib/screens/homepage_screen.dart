import 'package:auto_route/auto_route.dart';
import 'package:baetobe/components/custom_icons.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/components/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:baetobe/application/routing/routes.gr.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        DiscoverTabRoute(),
        LikesTabRoute(),
        MatchesTabRoute(),
        ProfileTabRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              height: 60,
              indicatorColor: Theme.of(context).primaryColorLight,
            ),
            child: CustomNavigationBar(
              animationDuration: const Duration(milliseconds: 400),
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: tabsRouter.setActiveIndex,
              backgroundColor: Colors.white,
              destinations: [
                CustomNavigationDestination(
                    icon: Stack(
                      clipBehavior: Clip.none,
                      children: const [
                        Icon(BTBCustomIcons.b,
                            color:
                                Color(CustomColors.bottomNavBarInactiveColor)),
                        Positioned(
                          bottom: 0,
                          right: -3,
                          child: Icon(
                            BTBCustomIcons.btbheart,
                            color: Colors.red,
                            size: 5,
                          ),
                        ),
                      ],
                    ),
                    selectedIcon: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          BTBCustomIcons.b,
                          color: Theme.of(context).primaryColor,
                        ),
                        const Positioned(
                          bottom: 0,
                          right: -3,
                          child: Icon(
                            BTBCustomIcons.btbheart,
                            color: Colors.red,
                            size: 5,
                          ),
                        ),
                      ],
                    ),
                    label: 'Discover'),
                CustomNavigationDestination(
                    icon: const Icon(BTBCustomIcons.likes,
                        color: Color(CustomColors.bottomNavBarInactiveColor)),
                    selectedIcon: Icon(
                      BTBCustomIcons.likes,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: 'Likes'),
                CustomNavigationDestination(
                    icon: const Icon(BTBCustomIcons.chat,
                        color: Color(CustomColors.bottomNavBarInactiveColor)),
                    selectedIcon: Icon(
                      BTBCustomIcons.chat,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: 'Matches'),
                CustomNavigationDestination(
                    icon: const Icon(BTBCustomIcons.profile,
                        color: Color(CustomColors.bottomNavBarInactiveColor)),
                    selectedIcon: Icon(
                      BTBCustomIcons.profile,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: 'Profile'),
              ],
            ),
          ),
        );
      },
    );
  }
}
