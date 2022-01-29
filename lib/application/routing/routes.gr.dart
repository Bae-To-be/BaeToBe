// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:baetobe/application/routing/auth_guard.dart' as _i15;
import 'package:baetobe/screens/boot/splash_screen.dart' as _i1;
import 'package:baetobe/screens/home/discover_tab.dart' as _i9;
import 'package:baetobe/screens/home/likes_tab.dart' as _i10;
import 'package:baetobe/screens/home/matches_tab.dart' as _i11;
import 'package:baetobe/screens/home/profile_tab.dart' as _i12;
import 'package:baetobe/screens/homepage_screen.dart' as _i8;
import 'package:baetobe/screens/login_screen.dart' as _i2;
import 'package:baetobe/screens/user_update/education_history_screen.dart'
    as _i7;
import 'package:baetobe/screens/user_update/update_birthday_screen.dart' as _i3;
import 'package:baetobe/screens/user_update/update_gender_screen.dart' as _i4;
import 'package:baetobe/screens/user_update/update_interested_gender_screen.dart'
    as _i5;
import 'package:baetobe/screens/user_update/update_work_information_screen.dart'
    as _i6;
import 'package:flutter/material.dart' as _i14;

class AppRouter extends _i13.RootStackRouter {
  AppRouter(
      {_i14.GlobalKey<_i14.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i15.AuthGuard authGuard;

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    UpdateBirthdayScreenRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.UpdateBirthdayScreen());
    },
    UpdateGenderScreenRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.UpdateGenderScreen());
    },
    UpdateInterestedGenderScreenRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i5.UpdateInterestedGenderScreen());
    },
    UpdateWorkInformationScreenRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.UpdateWorkInformationScreen());
    },
    EducationHistoryScreenRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.EducationHistoryScreen());
    },
    HomepageScreenRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.HomepageScreen());
    },
    DiscoverTabRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.DiscoverTab());
    },
    LikesTabRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.LikesTab());
    },
    MatchesTabRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i11.MatchesTab());
    },
    ProfileTabRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.ProfileTab());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i13.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i13.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i13.RouteConfig(UpdateBirthdayScreenRoute.name,
            path: '/birthday', guards: [authGuard]),
        _i13.RouteConfig(UpdateGenderScreenRoute.name,
            path: '/gender', guards: [authGuard]),
        _i13.RouteConfig(UpdateInterestedGenderScreenRoute.name,
            path: '/interested_genders', guards: [authGuard]),
        _i13.RouteConfig(UpdateWorkInformationScreenRoute.name,
            path: '/work_details', guards: [authGuard]),
        _i13.RouteConfig(EducationHistoryScreenRoute.name,
            path: '/education_history', guards: [authGuard]),
        _i13.RouteConfig(HomepageScreenRoute.name, path: '/home', guards: [
          authGuard
        ], children: [
          _i13.RouteConfig(DiscoverTabRoute.name,
              path: '', parent: HomepageScreenRoute.name),
          _i13.RouteConfig(LikesTabRoute.name,
              path: 'likes', parent: HomepageScreenRoute.name),
          _i13.RouteConfig(MatchesTabRoute.name,
              path: 'matches', parent: HomepageScreenRoute.name),
          _i13.RouteConfig(ProfileTabRoute.name,
              path: 'profile', parent: HomepageScreenRoute.name),
          _i13.RouteConfig('*#redirect',
              path: '*',
              parent: HomepageScreenRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i13.RouteConfig('*#redirect',
            path: '*', redirectTo: '/login', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i13.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i13.PageRouteInfo<void> {
  const LoginScreenRoute() : super(LoginScreenRoute.name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.UpdateBirthdayScreen]
class UpdateBirthdayScreenRoute extends _i13.PageRouteInfo<void> {
  const UpdateBirthdayScreenRoute()
      : super(UpdateBirthdayScreenRoute.name, path: '/birthday');

  static const String name = 'UpdateBirthdayScreenRoute';
}

/// generated route for
/// [_i4.UpdateGenderScreen]
class UpdateGenderScreenRoute extends _i13.PageRouteInfo<void> {
  const UpdateGenderScreenRoute()
      : super(UpdateGenderScreenRoute.name, path: '/gender');

  static const String name = 'UpdateGenderScreenRoute';
}

/// generated route for
/// [_i5.UpdateInterestedGenderScreen]
class UpdateInterestedGenderScreenRoute extends _i13.PageRouteInfo<void> {
  const UpdateInterestedGenderScreenRoute()
      : super(UpdateInterestedGenderScreenRoute.name,
            path: '/interested_genders');

  static const String name = 'UpdateInterestedGenderScreenRoute';
}

/// generated route for
/// [_i6.UpdateWorkInformationScreen]
class UpdateWorkInformationScreenRoute extends _i13.PageRouteInfo<void> {
  const UpdateWorkInformationScreenRoute()
      : super(UpdateWorkInformationScreenRoute.name, path: '/work_details');

  static const String name = 'UpdateWorkInformationScreenRoute';
}

/// generated route for
/// [_i7.EducationHistoryScreen]
class EducationHistoryScreenRoute extends _i13.PageRouteInfo<void> {
  const EducationHistoryScreenRoute()
      : super(EducationHistoryScreenRoute.name, path: '/education_history');

  static const String name = 'EducationHistoryScreenRoute';
}

/// generated route for
/// [_i8.HomepageScreen]
class HomepageScreenRoute extends _i13.PageRouteInfo<void> {
  const HomepageScreenRoute({List<_i13.PageRouteInfo>? children})
      : super(HomepageScreenRoute.name,
            path: '/home', initialChildren: children);

  static const String name = 'HomepageScreenRoute';
}

/// generated route for
/// [_i9.DiscoverTab]
class DiscoverTabRoute extends _i13.PageRouteInfo<void> {
  const DiscoverTabRoute() : super(DiscoverTabRoute.name, path: '');

  static const String name = 'DiscoverTabRoute';
}

/// generated route for
/// [_i10.LikesTab]
class LikesTabRoute extends _i13.PageRouteInfo<void> {
  const LikesTabRoute() : super(LikesTabRoute.name, path: 'likes');

  static const String name = 'LikesTabRoute';
}

/// generated route for
/// [_i11.MatchesTab]
class MatchesTabRoute extends _i13.PageRouteInfo<void> {
  const MatchesTabRoute() : super(MatchesTabRoute.name, path: 'matches');

  static const String name = 'MatchesTabRoute';
}

/// generated route for
/// [_i12.ProfileTab]
class ProfileTabRoute extends _i13.PageRouteInfo<void> {
  const ProfileTabRoute() : super(ProfileTabRoute.name, path: 'profile');

  static const String name = 'ProfileTabRoute';
}
