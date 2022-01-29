// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:baetobe/screens/boot/splash_screen.dart' as _i1;
import 'package:baetobe/screens/home/discover_tab.dart' as _i6;
import 'package:baetobe/screens/home/likes_tab.dart' as _i7;
import 'package:baetobe/screens/home/matches_tab.dart' as _i8;
import 'package:baetobe/screens/home/profile_tab.dart' as _i9;
import 'package:baetobe/screens/homepage_screen.dart' as _i5;
import 'package:baetobe/screens/login_screen.dart' as _i2;
import 'package:baetobe/screens/user_update/update_birthday_screen.dart' as _i3;
import 'package:baetobe/screens/user_update/update_gender_screen.dart' as _i4;
import 'package:flutter/material.dart' as _i11;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    UpdateBirthdayScreenRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.UpdateBirthdayScreen());
    },
    UpdateGenderScreenRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.UpdateGenderScreen());
    },
    HomepageScreenRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.HomepageScreen());
    },
    DiscoverTabRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.DiscoverTab());
    },
    LikesTabRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.LikesTab());
    },
    MatchesTabRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.MatchesTab());
    },
    ProfileTabRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.ProfileTab());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i10.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i10.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i10.RouteConfig(UpdateBirthdayScreenRoute.name, path: '/birthday'),
        _i10.RouteConfig(UpdateGenderScreenRoute.name, path: '/gender'),
        _i10.RouteConfig(HomepageScreenRoute.name, path: '/home', children: [
          _i10.RouteConfig(DiscoverTabRoute.name,
              path: '', parent: HomepageScreenRoute.name),
          _i10.RouteConfig(LikesTabRoute.name,
              path: 'likes', parent: HomepageScreenRoute.name),
          _i10.RouteConfig(MatchesTabRoute.name,
              path: 'matches', parent: HomepageScreenRoute.name),
          _i10.RouteConfig(ProfileTabRoute.name,
              path: 'profile', parent: HomepageScreenRoute.name),
          _i10.RouteConfig('*#redirect',
              path: '*',
              parent: HomepageScreenRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i10.RouteConfig('*#redirect',
            path: '*', redirectTo: '/login', fullMatch: true)
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashScreenRoute extends _i10.PageRouteInfo<void> {
  const SplashScreenRoute() : super(name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for [_i2.LoginScreen]
class LoginScreenRoute extends _i10.PageRouteInfo<void> {
  const LoginScreenRoute() : super(name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for [_i3.UpdateBirthdayScreen]
class UpdateBirthdayScreenRoute extends _i10.PageRouteInfo<void> {
  const UpdateBirthdayScreenRoute() : super(name, path: '/birthday');

  static const String name = 'UpdateBirthdayScreenRoute';
}

/// generated route for [_i4.UpdateGenderScreen]
class UpdateGenderScreenRoute extends _i10.PageRouteInfo<void> {
  const UpdateGenderScreenRoute() : super(name, path: '/gender');

  static const String name = 'UpdateGenderScreenRoute';
}

/// generated route for [_i5.HomepageScreen]
class HomepageScreenRoute extends _i10.PageRouteInfo<void> {
  const HomepageScreenRoute({List<_i10.PageRouteInfo>? children})
      : super(name, path: '/home', initialChildren: children);

  static const String name = 'HomepageScreenRoute';
}

/// generated route for [_i6.DiscoverTab]
class DiscoverTabRoute extends _i10.PageRouteInfo<void> {
  const DiscoverTabRoute() : super(name, path: '');

  static const String name = 'DiscoverTabRoute';
}

/// generated route for [_i7.LikesTab]
class LikesTabRoute extends _i10.PageRouteInfo<void> {
  const LikesTabRoute() : super(name, path: 'likes');

  static const String name = 'LikesTabRoute';
}

/// generated route for [_i8.MatchesTab]
class MatchesTabRoute extends _i10.PageRouteInfo<void> {
  const MatchesTabRoute() : super(name, path: 'matches');

  static const String name = 'MatchesTabRoute';
}

/// generated route for [_i9.ProfileTab]
class ProfileTabRoute extends _i10.PageRouteInfo<void> {
  const ProfileTabRoute() : super(name, path: 'profile');

  static const String name = 'ProfileTabRoute';
}
