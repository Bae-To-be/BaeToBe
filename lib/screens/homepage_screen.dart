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
    items: [
      BottomNavigationBarItem(
          icon: Icon(
            BTBCustomIcons.home,
            color: Theme.of(context).primaryColorLight,
          ),
          activeIcon: Icon(
            BTBCustomIcons.home,
            color: Theme.of(context).primaryColor,
          ),
          label: 'Discover'),
      BottomNavigationBarItem(
          icon: Icon(
            BTBCustomIcons.likes,
            color: Theme.of(context).primaryColorLight,
          ),
          activeIcon: Icon(
            BTBCustomIcons.likes,
            color: Theme.of(context).primaryColor,
          ),
          label: 'Tab 2'),
      BottomNavigationBarItem(
          icon: Icon(
            BTBCustomIcons.chat,
            color: Theme.of(context).primaryColorLight,
          ),
          activeIcon: Icon(
            BTBCustomIcons.chat,
            color: Theme.of(context).primaryColor,
          ),
          label: 'Tab 3'),
      BottomNavigationBarItem(
          icon: Icon(
            BTBCustomIcons.profile,
            color: Theme.of(context).primaryColorLight,
          ),
          activeIcon: Icon(
            BTBCustomIcons.profile,
            color: Theme.of(context).primaryColor,
          ),
          label: 'Tab 4'),
    ],
  );
}
