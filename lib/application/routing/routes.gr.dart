// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:baetobe/screens/boot/splash_screen.dart' as _i1;
import 'package:baetobe/screens/home/discover_tab.dart' as _i4;
import 'package:baetobe/screens/home/likes_tab.dart' as _i5;
import 'package:baetobe/screens/home/matches_tab.dart' as _i6;
import 'package:baetobe/screens/home/profile_tab.dart' as _i7;
import 'package:baetobe/screens/homepage_screen.dart' as _i3;
import 'package:baetobe/screens/login_screen.dart' as _i2;
import 'package:flutter/material.dart' as _i9;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SplashScreenRouteArgs>(
          orElse: () => const SplashScreenRouteArgs());
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i1.SplashScreen(key: args.key, boot: args.boot));
    },
    LoginScreenRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    HomepageScreenRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.HomepageScreen());
    },
    DiscoverTabRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.DiscoverTab());
    },
    LikesTabRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.LikesTab());
    },
    MatchesTabRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.MatchesTab());
    },
    ProfileTabRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.ProfileTab());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i8.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i8.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i8.RouteConfig(HomepageScreenRoute.name, path: '/home', children: [
          _i8.RouteConfig(DiscoverTabRoute.name,
              path: '', parent: HomepageScreenRoute.name),
          _i8.RouteConfig(LikesTabRoute.name,
              path: 'likes', parent: HomepageScreenRoute.name),
          _i8.RouteConfig(MatchesTabRoute.name,
              path: 'matches', parent: HomepageScreenRoute.name),
          _i8.RouteConfig(ProfileTabRoute.name,
              path: 'profile', parent: HomepageScreenRoute.name),
          _i8.RouteConfig('*#redirect',
              path: '*',
              parent: HomepageScreenRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i8.RouteConfig('*#redirect',
            path: '*', redirectTo: '/login', fullMatch: true)
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashScreenRoute extends _i8.PageRouteInfo<SplashScreenRouteArgs> {
  SplashScreenRoute({_i9.Key? key, bool boot = false})
      : super(name,
            path: '/splash', args: SplashScreenRouteArgs(key: key, boot: boot));

  static const String name = 'SplashScreenRoute';
}

class SplashScreenRouteArgs {
  const SplashScreenRouteArgs({this.key, this.boot = false});

  final _i9.Key? key;

  final bool boot;
}

/// generated route for [_i2.LoginScreen]
class LoginScreenRoute extends _i8.PageRouteInfo<void> {
  const LoginScreenRoute() : super(name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for [_i3.HomepageScreen]
class HomepageScreenRoute extends _i8.PageRouteInfo<void> {
  const HomepageScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(name, path: '/home', initialChildren: children);

  static const String name = 'HomepageScreenRoute';
}

/// generated route for [_i4.DiscoverTab]
class DiscoverTabRoute extends _i8.PageRouteInfo<void> {
  const DiscoverTabRoute() : super(name, path: '');

  static const String name = 'DiscoverTabRoute';
}

/// generated route for [_i5.LikesTab]
class LikesTabRoute extends _i8.PageRouteInfo<void> {
  const LikesTabRoute() : super(name, path: 'likes');

  static const String name = 'LikesTabRoute';
}

/// generated route for [_i6.MatchesTab]
class MatchesTabRoute extends _i8.PageRouteInfo<void> {
  const MatchesTabRoute() : super(name, path: 'matches');

  static const String name = 'MatchesTabRoute';
}

/// generated route for [_i7.ProfileTab]
class ProfileTabRoute extends _i8.PageRouteInfo<void> {
  const ProfileTabRoute() : super(name, path: 'profile');

  static const String name = 'ProfileTabRoute';
}
