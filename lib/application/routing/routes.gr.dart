// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i19;
import 'package:baetobe/application/routing/auth_guard.dart' as _i21;
import 'package:baetobe/screens/boot/splash_screen.dart' as _i1;
import 'package:baetobe/screens/home/discover_tab.dart' as _i15;
import 'package:baetobe/screens/home/likes_tab.dart' as _i16;
import 'package:baetobe/screens/home/matches_tab.dart' as _i17;
import 'package:baetobe/screens/home/profile_tab.dart' as _i18;
import 'package:baetobe/screens/homepage_screen.dart' as _i14;
import 'package:baetobe/screens/kyc/under_verification.dart' as _i12;
import 'package:baetobe/screens/kyc/verification_rejected.dart' as _i13;
import 'package:baetobe/screens/login_screen.dart' as _i2;
import 'package:baetobe/screens/user_update/education_history_screen.dart'
    as _i7;
import 'package:baetobe/screens/user_update/identity_verification_screen.dart'
    as _i11;
import 'package:baetobe/screens/user_update/linkedin_url_screen.dart' as _i8;
import 'package:baetobe/screens/user_update/selfie_verification_screen.dart'
    as _i10;
import 'package:baetobe/screens/user_update/update_birthday_screen.dart' as _i3;
import 'package:baetobe/screens/user_update/update_gender_screen.dart' as _i4;
import 'package:baetobe/screens/user_update/update_interested_gender_screen.dart'
    as _i5;
import 'package:baetobe/screens/user_update/update_work_information_screen.dart'
    as _i6;
import 'package:baetobe/screens/user_update/upload_images_screen.dart' as _i9;
import 'package:flutter/material.dart' as _i20;

class AppRouter extends _i19.RootStackRouter {
  AppRouter(
      {_i20.GlobalKey<_i20.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i21.AuthGuard authGuard;

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    UpdateBirthdayScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<UpdateBirthdayScreenRouteArgs>(
          orElse: () => UpdateBirthdayScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.UpdateBirthdayScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    UpdateGenderScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.UpdateGenderScreen());
    },
    UpdateInterestedGenderScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i5.UpdateInterestedGenderScreen());
    },
    UpdateWorkInformationScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<UpdateWorkInformationScreenRouteArgs>(
          orElse: () => UpdateWorkInformationScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i6.UpdateWorkInformationScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    EducationHistoryScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<EducationHistoryScreenRouteArgs>(
          orElse: () => EducationHistoryScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i7.EducationHistoryScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    LinkedinUrlScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<LinkedinUrlScreenRouteArgs>(
          orElse: () => LinkedinUrlScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i8.LinkedinUrlScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    UploadImagesScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.UploadImagesScreen());
    },
    SelfieVerificationScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<SelfieVerificationScreenRouteArgs>(
          orElse: () => SelfieVerificationScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i10.SelfieVerificationScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    IdentityVerificationScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<IdentityVerificationScreenRouteArgs>(
          orElse: () => IdentityVerificationScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i11.IdentityVerificationScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    UnderVerificationRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.UnderVerification());
    },
    VerificationRejectedRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.VerificationRejected());
    },
    HomepageScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i14.HomepageScreen());
    },
    DiscoverTabRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i15.DiscoverTab());
    },
    LikesTabRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i16.LikesTab());
    },
    MatchesTabRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i17.MatchesTab());
    },
    ProfileTabRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i18.ProfileTab());
    }
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i19.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i19.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i19.RouteConfig(UpdateBirthdayScreenRoute.name,
            path: '/birthday', guards: [authGuard]),
        _i19.RouteConfig(UpdateGenderScreenRoute.name,
            path: '/gender', guards: [authGuard]),
        _i19.RouteConfig(UpdateInterestedGenderScreenRoute.name,
            path: '/interested_genders', guards: [authGuard]),
        _i19.RouteConfig(UpdateWorkInformationScreenRoute.name,
            path: '/work_details', guards: [authGuard]),
        _i19.RouteConfig(EducationHistoryScreenRoute.name,
            path: '/education_history', guards: [authGuard]),
        _i19.RouteConfig(LinkedinUrlScreenRoute.name,
            path: '/linkedin_url', guards: [authGuard]),
        _i19.RouteConfig(UploadImagesScreenRoute.name,
            path: '/images', guards: [authGuard]),
        _i19.RouteConfig(SelfieVerificationScreenRoute.name,
            path: '/selfie_verification', guards: [authGuard]),
        _i19.RouteConfig(IdentityVerificationScreenRoute.name,
            path: '/identity_verification', guards: [authGuard]),
        _i19.RouteConfig(UnderVerificationRoute.name,
            path: '/under_verification', guards: [authGuard]),
        _i19.RouteConfig(VerificationRejectedRoute.name,
            path: '/rejected', guards: [authGuard]),
        _i19.RouteConfig(HomepageScreenRoute.name, path: '/home', guards: [
          authGuard
        ], children: [
          _i19.RouteConfig(DiscoverTabRoute.name,
              path: '', parent: HomepageScreenRoute.name),
          _i19.RouteConfig(LikesTabRoute.name,
              path: 'likes', parent: HomepageScreenRoute.name),
          _i19.RouteConfig(MatchesTabRoute.name,
              path: 'matches', parent: HomepageScreenRoute.name),
          _i19.RouteConfig(ProfileTabRoute.name,
              path: 'profile', parent: HomepageScreenRoute.name),
          _i19.RouteConfig('*#redirect',
              path: '*',
              parent: HomepageScreenRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i19.RouteConfig('*#redirect',
            path: '*', redirectTo: '/login', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i19.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i19.PageRouteInfo<void> {
  const LoginScreenRoute() : super(LoginScreenRoute.name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.UpdateBirthdayScreen]
class UpdateBirthdayScreenRoute
    extends _i19.PageRouteInfo<UpdateBirthdayScreenRouteArgs> {
  UpdateBirthdayScreenRoute({_i20.Key? key, bool? redirectBack})
      : super(UpdateBirthdayScreenRoute.name,
            path: '/birthday',
            args: UpdateBirthdayScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'UpdateBirthdayScreenRoute';
}

class UpdateBirthdayScreenRouteArgs {
  const UpdateBirthdayScreenRouteArgs({this.key, this.redirectBack});

  final _i20.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'UpdateBirthdayScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i4.UpdateGenderScreen]
class UpdateGenderScreenRoute extends _i19.PageRouteInfo<void> {
  const UpdateGenderScreenRoute()
      : super(UpdateGenderScreenRoute.name, path: '/gender');

  static const String name = 'UpdateGenderScreenRoute';
}

/// generated route for
/// [_i5.UpdateInterestedGenderScreen]
class UpdateInterestedGenderScreenRoute extends _i19.PageRouteInfo<void> {
  const UpdateInterestedGenderScreenRoute()
      : super(UpdateInterestedGenderScreenRoute.name,
            path: '/interested_genders');

  static const String name = 'UpdateInterestedGenderScreenRoute';
}

/// generated route for
/// [_i6.UpdateWorkInformationScreen]
class UpdateWorkInformationScreenRoute
    extends _i19.PageRouteInfo<UpdateWorkInformationScreenRouteArgs> {
  UpdateWorkInformationScreenRoute({_i20.Key? key, bool? redirectBack})
      : super(UpdateWorkInformationScreenRoute.name,
            path: '/work_details',
            args: UpdateWorkInformationScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'UpdateWorkInformationScreenRoute';
}

class UpdateWorkInformationScreenRouteArgs {
  const UpdateWorkInformationScreenRouteArgs({this.key, this.redirectBack});

  final _i20.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'UpdateWorkInformationScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i7.EducationHistoryScreen]
class EducationHistoryScreenRoute
    extends _i19.PageRouteInfo<EducationHistoryScreenRouteArgs> {
  EducationHistoryScreenRoute({_i20.Key? key, bool? redirectBack})
      : super(EducationHistoryScreenRoute.name,
            path: '/education_history',
            args: EducationHistoryScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'EducationHistoryScreenRoute';
}

class EducationHistoryScreenRouteArgs {
  const EducationHistoryScreenRouteArgs({this.key, this.redirectBack});

  final _i20.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'EducationHistoryScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i8.LinkedinUrlScreen]
class LinkedinUrlScreenRoute
    extends _i19.PageRouteInfo<LinkedinUrlScreenRouteArgs> {
  LinkedinUrlScreenRoute({_i20.Key? key, bool? redirectBack})
      : super(LinkedinUrlScreenRoute.name,
            path: '/linkedin_url',
            args: LinkedinUrlScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'LinkedinUrlScreenRoute';
}

class LinkedinUrlScreenRouteArgs {
  const LinkedinUrlScreenRouteArgs({this.key, this.redirectBack});

  final _i20.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'LinkedinUrlScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i9.UploadImagesScreen]
class UploadImagesScreenRoute extends _i19.PageRouteInfo<void> {
  const UploadImagesScreenRoute()
      : super(UploadImagesScreenRoute.name, path: '/images');

  static const String name = 'UploadImagesScreenRoute';
}

/// generated route for
/// [_i10.SelfieVerificationScreen]
class SelfieVerificationScreenRoute
    extends _i19.PageRouteInfo<SelfieVerificationScreenRouteArgs> {
  SelfieVerificationScreenRoute({_i20.Key? key, bool? redirectBack})
      : super(SelfieVerificationScreenRoute.name,
            path: '/selfie_verification',
            args: SelfieVerificationScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'SelfieVerificationScreenRoute';
}

class SelfieVerificationScreenRouteArgs {
  const SelfieVerificationScreenRouteArgs({this.key, this.redirectBack});

  final _i20.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'SelfieVerificationScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i11.IdentityVerificationScreen]
class IdentityVerificationScreenRoute
    extends _i19.PageRouteInfo<IdentityVerificationScreenRouteArgs> {
  IdentityVerificationScreenRoute({_i20.Key? key, bool? redirectBack})
      : super(IdentityVerificationScreenRoute.name,
            path: '/identity_verification',
            args: IdentityVerificationScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'IdentityVerificationScreenRoute';
}

class IdentityVerificationScreenRouteArgs {
  const IdentityVerificationScreenRouteArgs({this.key, this.redirectBack});

  final _i20.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'IdentityVerificationScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i12.UnderVerification]
class UnderVerificationRoute extends _i19.PageRouteInfo<void> {
  const UnderVerificationRoute()
      : super(UnderVerificationRoute.name, path: '/under_verification');

  static const String name = 'UnderVerificationRoute';
}

/// generated route for
/// [_i13.VerificationRejected]
class VerificationRejectedRoute extends _i19.PageRouteInfo<void> {
  const VerificationRejectedRoute()
      : super(VerificationRejectedRoute.name, path: '/rejected');

  static const String name = 'VerificationRejectedRoute';
}

/// generated route for
/// [_i14.HomepageScreen]
class HomepageScreenRoute extends _i19.PageRouteInfo<void> {
  const HomepageScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(HomepageScreenRoute.name,
            path: '/home', initialChildren: children);

  static const String name = 'HomepageScreenRoute';
}

/// generated route for
/// [_i15.DiscoverTab]
class DiscoverTabRoute extends _i19.PageRouteInfo<void> {
  const DiscoverTabRoute() : super(DiscoverTabRoute.name, path: '');

  static const String name = 'DiscoverTabRoute';
}

/// generated route for
/// [_i16.LikesTab]
class LikesTabRoute extends _i19.PageRouteInfo<void> {
  const LikesTabRoute() : super(LikesTabRoute.name, path: 'likes');

  static const String name = 'LikesTabRoute';
}

/// generated route for
/// [_i17.MatchesTab]
class MatchesTabRoute extends _i19.PageRouteInfo<void> {
  const MatchesTabRoute() : super(MatchesTabRoute.name, path: 'matches');

  static const String name = 'MatchesTabRoute';
}

/// generated route for
/// [_i18.ProfileTab]
class ProfileTabRoute extends _i19.PageRouteInfo<void> {
  const ProfileTabRoute() : super(ProfileTabRoute.name, path: 'profile');

  static const String name = 'ProfileTabRoute';
}
