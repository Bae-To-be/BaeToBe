// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:baetobe/screens/boot/splash_screen.dart' as _i1;
import 'package:baetobe/screens/home/discover_tab.dart' as _i7;
import 'package:baetobe/screens/home/likes_tab.dart' as _i8;
import 'package:baetobe/screens/home/matches_tab.dart' as _i9;
import 'package:baetobe/screens/home/profile_tab.dart' as _i10;
import 'package:baetobe/screens/homepage_screen.dart' as _i6;
import 'package:baetobe/screens/login_screen.dart' as _i2;
import 'package:baetobe/screens/user_update/update_birthday_screen.dart' as _i3;
import 'package:baetobe/screens/user_update/update_gender_screen.dart' as _i4;
import 'package:baetobe/screens/user_update/update_interested_gender_screen.dart'
    as _i5;
import 'package:flutter/material.dart' as _i12;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    UpdateBirthdayScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.UpdateBirthdayScreen());
    },
    UpdateGenderScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.UpdateGenderScreen());
    },
    UpdateInterestedGenderScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i5.UpdateInterestedGenderScreen());
    },
    HomepageScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.HomepageScreen());
    },
    DiscoverTabRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.DiscoverTab());
    },
    LikesTabRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.LikesTab());
    },
    MatchesTabRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.MatchesTab());
    },
    ProfileTabRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.ProfileTab());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i11.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i11.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i11.RouteConfig(UpdateBirthdayScreenRoute.name, path: '/birthday'),
        _i11.RouteConfig(UpdateGenderScreenRoute.name, path: '/gender'),
        _i11.RouteConfig(UpdateInterestedGenderScreenRoute.name,
            path: '/interested_genders'),
        _i11.RouteConfig(HomepageScreenRoute.name, path: '/home', children: [
          _i11.RouteConfig(DiscoverTabRoute.name,
              path: '', parent: HomepageScreenRoute.name),
          _i11.RouteConfig(LikesTabRoute.name,
              path: 'likes', parent: HomepageScreenRoute.name),
          _i11.RouteConfig(MatchesTabRoute.name,
              path: 'matches', parent: HomepageScreenRoute.name),
          _i11.RouteConfig(ProfileTabRoute.name,
              path: 'profile', parent: HomepageScreenRoute.name),
          _i11.RouteConfig('*#redirect',
              path: '*',
              parent: HomepageScreenRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i11.RouteConfig('*#redirect',
            path: '*', redirectTo: '/login', fullMatch: true)
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashScreenRoute extends _i11.PageRouteInfo<void> {
  const SplashScreenRoute() : super(name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for [_i2.LoginScreen]
class LoginScreenRoute extends _i11.PageRouteInfo<void> {
  const LoginScreenRoute() : super(name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for [_i3.UpdateBirthdayScreen]
class UpdateBirthdayScreenRoute extends _i11.PageRouteInfo<void> {
  const UpdateBirthdayScreenRoute() : super(name, path: '/birthday');

  static const String name = 'UpdateBirthdayScreenRoute';
}

/// generated route for [_i4.UpdateGenderScreen]
class UpdateGenderScreenRoute extends _i11.PageRouteInfo<void> {
  const UpdateGenderScreenRoute() : super(name, path: '/gender');

  static const String name = 'UpdateGenderScreenRoute';
}

/// generated route for [_i5.UpdateInterestedGenderScreen]
class UpdateInterestedGenderScreenRoute extends _i11.PageRouteInfo<void> {
  const UpdateInterestedGenderScreenRoute()
      : super(name, path: '/interested_genders');

  static const String name = 'UpdateInterestedGenderScreenRoute';
}

/// generated route for [_i6.HomepageScreen]
class HomepageScreenRoute extends _i11.PageRouteInfo<void> {
  const HomepageScreenRoute({List<_i11.PageRouteInfo>? children})
      : super(name, path: '/home', initialChildren: children);

  static const String name = 'HomepageScreenRoute';
}

/// generated route for [_i7.DiscoverTab]
class DiscoverTabRoute extends _i11.PageRouteInfo<void> {
  const DiscoverTabRoute() : super(name, path: '');

  static const String name = 'DiscoverTabRoute';
}

/// generated route for [_i8.LikesTab]
class LikesTabRoute extends _i11.PageRouteInfo<void> {
  const LikesTabRoute() : super(name, path: 'likes');

  static const String name = 'LikesTabRoute';
}

/// generated route for [_i9.MatchesTab]
class MatchesTabRoute extends _i11.PageRouteInfo<void> {
  const MatchesTabRoute() : super(name, path: 'matches');

  static const String name = 'MatchesTabRoute';
}

/// generated route for [_i10.ProfileTab]
class ProfileTabRoute extends _i11.PageRouteInfo<void> {
  const ProfileTabRoute() : super(name, path: 'profile');

  static const String name = 'ProfileTabRoute';
}
