// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:baetobe/screens/home/discover_tab.dart' as _i3;
import 'package:baetobe/screens/home/likes_tab.dart' as _i4;
import 'package:baetobe/screens/home/matches_tab.dart' as _i5;
import 'package:baetobe/screens/home/profile_tab.dart' as _i6;
import 'package:baetobe/screens/homepage_screen.dart' as _i2;
import 'package:baetobe/screens/login_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i8;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    HomepageScreenRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomepageScreen());
    },
    DiscoverTabRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.DiscoverTab());
    },
    LikesTabRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.LikesTab());
    },
    MatchesTabRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.MatchesTab());
    },
    ProfileTabRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.ProfileTab());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i7.RouteConfig(HomepageScreenRoute.name, path: '/', children: [
          _i7.RouteConfig(DiscoverTabRoute.name,
              path: 'discover', parent: HomepageScreenRoute.name),
          _i7.RouteConfig(LikesTabRoute.name,
              path: 'likes', parent: HomepageScreenRoute.name),
          _i7.RouteConfig(MatchesTabRoute.name,
              path: 'matches', parent: HomepageScreenRoute.name),
          _i7.RouteConfig(ProfileTabRoute.name,
              path: 'profile', parent: HomepageScreenRoute.name),
          _i7.RouteConfig('*#redirect',
              path: '*',
              parent: HomepageScreenRoute.name,
              redirectTo: 'discover',
              fullMatch: true)
        ]),
        _i7.RouteConfig('*#redirect',
            path: '*', redirectTo: '/login', fullMatch: true)
      ];
}

/// generated route for [_i1.LoginScreen]
class LoginScreenRoute extends _i7.PageRouteInfo<void> {
  const LoginScreenRoute() : super(name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for [_i2.HomepageScreen]
class HomepageScreenRoute extends _i7.PageRouteInfo<void> {
  const HomepageScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'HomepageScreenRoute';
}

/// generated route for [_i3.DiscoverTab]
class DiscoverTabRoute extends _i7.PageRouteInfo<void> {
  const DiscoverTabRoute() : super(name, path: 'discover');

  static const String name = 'DiscoverTabRoute';
}

/// generated route for [_i4.LikesTab]
class LikesTabRoute extends _i7.PageRouteInfo<void> {
  const LikesTabRoute() : super(name, path: 'likes');

  static const String name = 'LikesTabRoute';
}

/// generated route for [_i5.MatchesTab]
class MatchesTabRoute extends _i7.PageRouteInfo<void> {
  const MatchesTabRoute() : super(name, path: 'matches');

  static const String name = 'MatchesTabRoute';
}

/// generated route for [_i6.ProfileTab]
class ProfileTabRoute extends _i7.PageRouteInfo<void> {
  const ProfileTabRoute() : super(name, path: 'profile');

  static const String name = 'ProfileTabRoute';
}
