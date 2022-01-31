import 'package:auto_route/auto_route.dart';
import 'package:baetobe/components/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:baetobe/application/routing/routes.gr.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DiscoverTabRoute(),
        LikesTabRoute(),
        MatchesTabRoute(),
        ProfileTabRoute(),
      ],
      duration: const Duration(milliseconds: 400),
      builder: (context, child, animation) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: buildBottomNavigationBar(context, tabsRouter),
        );
      },
    );
  }
}

BottomNavigationBar buildBottomNavigationBar(
    BuildContext context, TabsRouter tabsRouter) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    onTap: tabsRouter.setActiveIndex,
    currentIndex: tabsRouter.activeIndex,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: const [
              Icon(
                BTBCustomIcons.b,
              ),
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
          activeIcon: Stack(
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
      const BottomNavigationBarItem(
          icon: Icon(
            BTBCustomIcons.likes,
          ),
          label: 'Tab 2'),
      const BottomNavigationBarItem(
          icon: const Icon(
            BTBCustomIcons.chat,
          ),
          label: 'Tab 3'),
      const BottomNavigationBarItem(
          icon: Icon(
            BTBCustomIcons.profile,
          ),
          label: 'Tab 4'),
    ],
    unselectedItemColor: Theme.of(context).primaryColorLight,
    selectedItemColor: Theme.of(context).primaryColor,
  );
}
