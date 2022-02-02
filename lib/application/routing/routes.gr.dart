// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

<<<<<<< HEAD
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:baetobe/application/routing/auth_guard.dart' as _i26;
import 'package:baetobe/components/webview.dart' as _i24;
import 'package:baetobe/screens/boot/splash_screen.dart' as _i1;
import 'package:baetobe/screens/home/discover_tab.dart' as _i19;
import 'package:baetobe/screens/home/likes_tab.dart' as _i20;
import 'package:baetobe/screens/home/matches_tab.dart' as _i21;
import 'package:baetobe/screens/home/profile_tab.dart' as _i22;
=======
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:baetobe/application/routing/auth_guard.dart' as _i23;
import 'package:baetobe/screens/boot/splash_screen.dart' as _i1;
import 'package:baetobe/screens/home/discover_tab.dart' as _i15;
import 'package:baetobe/screens/home/likes/likes_received_tab.dart' as _i19;
import 'package:baetobe/screens/home/likes/likes_sent_tab.dart' as _i20;
import 'package:baetobe/screens/home/likes_tab.dart' as _i16;
import 'package:baetobe/screens/home/matches_tab.dart' as _i17;
import 'package:baetobe/screens/home/profile_tab.dart' as _i18;
>>>>>>> 518b5c4 (Adds like received and sent tabs)
import 'package:baetobe/screens/homepage_screen.dart' as _i14;
import 'package:baetobe/screens/kyc/under_verification.dart' as _i12;
import 'package:baetobe/screens/kyc/verification_rejected.dart' as _i13;
import 'package:baetobe/screens/login_screen.dart' as _i2;
import 'package:baetobe/screens/profile_screens/edit_profile_page.dart' as _i15;
import 'package:baetobe/screens/profile_screens/help_page.dart' as _i23;
import 'package:baetobe/screens/profile_screens/update_preferences_page.dart'
    as _i17;
import 'package:baetobe/screens/user_update/education_history_screen.dart'
    as _i7;
import 'package:baetobe/screens/user_update/identity_verification_screen.dart'
    as _i11;
import 'package:baetobe/screens/user_update/linkedin_url_screen.dart' as _i8;
import 'package:baetobe/screens/user_update/selfie_verification_screen.dart'
    as _i10;
import 'package:baetobe/screens/user_update/update_birthday_screen.dart' as _i3;
import 'package:baetobe/screens/user_update/update_gender_screen.dart' as _i4;
import 'package:baetobe/screens/user_update/update_hometown.dart' as _i18;
import 'package:baetobe/screens/user_update/update_interested_gender_screen.dart'
    as _i5;
import 'package:baetobe/screens/user_update/update_work_information_screen.dart'
    as _i6;
import 'package:baetobe/screens/user_update/upload_images_screen.dart' as _i9;
<<<<<<< HEAD
import 'package:flutter/material.dart' as _i25;

class AppRouter extends _i16.RootStackRouter {
  AppRouter(
      {_i25.GlobalKey<_i25.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i26.AuthGuard authGuard;

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
=======
import 'package:flutter/material.dart' as _i22;

class AppRouter extends _i21.RootStackRouter {
  AppRouter(
      {_i22.GlobalKey<_i22.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i23.AuthGuard authGuard;

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
>>>>>>> 518b5c4 (Adds like received and sent tabs)
          routeData: routeData, child: const _i2.LoginScreen());
    },
    UpdateBirthdayScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<UpdateBirthdayScreenRouteArgs>(
          orElse: () => UpdateBirthdayScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
<<<<<<< HEAD
      return _i16.AdaptivePage<dynamic>(
=======
      return _i21.AdaptivePage<dynamic>(
>>>>>>> 518b5c4 (Adds like received and sent tabs)
          routeData: routeData,
          child: _i3.UpdateBirthdayScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    UpdateGenderScreenRoute.name: (routeData) {
<<<<<<< HEAD
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<UpdateGenderScreenRouteArgs>(
          orElse: () => UpdateGenderScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.UpdateGenderScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    UpdateInterestedGenderScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<UpdateInterestedGenderScreenRouteArgs>(
          orElse: () => UpdateInterestedGenderScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
      return _i16.AdaptivePage<dynamic>(
=======
      return _i21.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.UpdateGenderScreen());
    },
    UpdateInterestedGenderScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
>>>>>>> 518b5c4 (Adds like received and sent tabs)
          routeData: routeData,
          child: _i5.UpdateInterestedGenderScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    UpdateWorkInformationScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<UpdateWorkInformationScreenRouteArgs>(
          orElse: () => UpdateWorkInformationScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
<<<<<<< HEAD
      return _i16.AdaptivePage<dynamic>(
=======
      return _i21.AdaptivePage<dynamic>(
>>>>>>> 518b5c4 (Adds like received and sent tabs)
          routeData: routeData,
          child: _i6.UpdateWorkInformationScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    EducationHistoryScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<EducationHistoryScreenRouteArgs>(
          orElse: () => EducationHistoryScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
<<<<<<< HEAD
      return _i16.AdaptivePage<dynamic>(
=======
      return _i21.AdaptivePage<dynamic>(
>>>>>>> 518b5c4 (Adds like received and sent tabs)
          routeData: routeData,
          child: _i7.EducationHistoryScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    LinkedinUrlScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<LinkedinUrlScreenRouteArgs>(
          orElse: () => LinkedinUrlScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
<<<<<<< HEAD
      return _i16.AdaptivePage<dynamic>(
=======
      return _i21.AdaptivePage<dynamic>(
>>>>>>> 518b5c4 (Adds like received and sent tabs)
          routeData: routeData,
          child: _i8.LinkedinUrlScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    UploadImagesScreenRoute.name: (routeData) {
<<<<<<< HEAD
      return _i16.AdaptivePage<dynamic>(
=======
      return _i21.AdaptivePage<dynamic>(
>>>>>>> 518b5c4 (Adds like received and sent tabs)
          routeData: routeData, child: const _i9.UploadImagesScreen());
    },
    SelfieVerificationScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<SelfieVerificationScreenRouteArgs>(
          orElse: () => SelfieVerificationScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
<<<<<<< HEAD
      return _i16.AdaptivePage<dynamic>(
=======
      return _i21.AdaptivePage<dynamic>(
>>>>>>> 518b5c4 (Adds like received and sent tabs)
          routeData: routeData,
          child: _i10.SelfieVerificationScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    IdentityVerificationScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<IdentityVerificationScreenRouteArgs>(
          orElse: () => IdentityVerificationScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
<<<<<<< HEAD
      return _i16.AdaptivePage<dynamic>(
=======
      return _i21.AdaptivePage<dynamic>(
>>>>>>> 518b5c4 (Adds like received and sent tabs)
          routeData: routeData,
          child: _i11.IdentityVerificationScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    UnderVerificationRoute.name: (routeData) {
<<<<<<< HEAD
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.UnderVerification());
    },
    VerificationRejectedRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.VerificationRejected());
    },
    HomepageScreenRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
=======
      return _i21.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.UnderVerification());
    },
    VerificationRejectedRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.VerificationRejected());
    },
    HomepageScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
>>>>>>> 518b5c4 (Adds like received and sent tabs)
          routeData: routeData, child: const _i14.HomepageScreen());
    },
    EditProfileRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i15.EditProfile());
    },
    EmptyRouterPageRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i16.EmptyRouterPage());
    },
    UpdatePreferencesRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i17.UpdatePreferences());
    },
    UpdateHometownRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i18.UpdateHometown());
    },
    DiscoverTabRoute.name: (routeData) {
<<<<<<< HEAD
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i19.DiscoverTab());
    },
    LikesTabRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i20.LikesTab());
    },
    MatchesTabRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i21.MatchesTab());
    },
    ProfileTabRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i22.ProfileTab());
    },
    HelpPageRoute.name: (routeData) {
      final args = routeData.argsAs<HelpPageRouteArgs>(
          orElse: () => const HelpPageRouteArgs());
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: _i23.HelpPage(key: args.key));
    },
    WebviewRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<WebviewRouteArgs>(
          orElse: () => WebviewRouteArgs(url: queryParams.optString('url')));
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i24.Webview(key: args.key, url: args.url));
=======
      return _i21.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i15.DiscoverTab());
    },
    LikesTabRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i16.LikesTab());
    },
    MatchesTabRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i17.MatchesTab());
    },
    ProfileTabRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i18.ProfileTab());
    },
    LikesReceivedTabRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i19.LikesReceivedTab());
    },
    LikesSentTabRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i20.LikesSentTab());
>>>>>>> 518b5c4 (Adds like received and sent tabs)
    }
  };

  @override
<<<<<<< HEAD
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i16.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i16.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i16.RouteConfig(UpdateBirthdayScreenRoute.name,
            path: '/birthday', guards: [authGuard]),
        _i16.RouteConfig(UpdateGenderScreenRoute.name,
            path: '/gender', guards: [authGuard]),
        _i16.RouteConfig(UpdateInterestedGenderScreenRoute.name,
            path: '/interested_genders', guards: [authGuard]),
        _i16.RouteConfig(UpdateWorkInformationScreenRoute.name,
            path: '/work_details', guards: [authGuard]),
        _i16.RouteConfig(EducationHistoryScreenRoute.name,
            path: '/education_history', guards: [authGuard]),
        _i16.RouteConfig(LinkedinUrlScreenRoute.name,
            path: '/linkedin_url', guards: [authGuard]),
        _i16.RouteConfig(UploadImagesScreenRoute.name,
            path: '/images', guards: [authGuard]),
        _i16.RouteConfig(SelfieVerificationScreenRoute.name,
            path: '/selfie_verification', guards: [authGuard]),
        _i16.RouteConfig(IdentityVerificationScreenRoute.name,
            path: '/identity_verification', guards: [authGuard]),
        _i16.RouteConfig(UnderVerificationRoute.name,
            path: '/under_verification', guards: [authGuard]),
        _i16.RouteConfig(VerificationRejectedRoute.name,
            path: '/rejected', guards: [authGuard]),
        _i16.RouteConfig(HomepageScreenRoute.name, path: '/home', guards: [
          authGuard
        ], children: [
          _i16.RouteConfig(DiscoverTabRoute.name,
              path: '', parent: HomepageScreenRoute.name),
          _i16.RouteConfig(LikesTabRoute.name,
              path: 'likes', parent: HomepageScreenRoute.name),
          _i16.RouteConfig(MatchesTabRoute.name,
              path: 'matches', parent: HomepageScreenRoute.name),
          _i16.RouteConfig(ProfileTabRoute.name,
              path: 'profile', parent: HomepageScreenRoute.name),
          _i16.RouteConfig('*#redirect',
=======
  List<_i21.RouteConfig> get routes => [
        _i21.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i21.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i21.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i21.RouteConfig(UpdateBirthdayScreenRoute.name,
            path: '/birthday', guards: [authGuard]),
        _i21.RouteConfig(UpdateGenderScreenRoute.name,
            path: '/gender', guards: [authGuard]),
        _i21.RouteConfig(UpdateInterestedGenderScreenRoute.name,
            path: '/interested_genders', guards: [authGuard]),
        _i21.RouteConfig(UpdateWorkInformationScreenRoute.name,
            path: '/work_details', guards: [authGuard]),
        _i21.RouteConfig(EducationHistoryScreenRoute.name,
            path: '/education_history', guards: [authGuard]),
        _i21.RouteConfig(LinkedinUrlScreenRoute.name,
            path: '/linkedin_url', guards: [authGuard]),
        _i21.RouteConfig(UploadImagesScreenRoute.name,
            path: '/images', guards: [authGuard]),
        _i21.RouteConfig(SelfieVerificationScreenRoute.name,
            path: '/selfie_verification', guards: [authGuard]),
        _i21.RouteConfig(IdentityVerificationScreenRoute.name,
            path: '/identity_verification', guards: [authGuard]),
        _i21.RouteConfig(UnderVerificationRoute.name,
            path: '/under_verification', guards: [authGuard]),
        _i21.RouteConfig(VerificationRejectedRoute.name,
            path: '/rejected', guards: [authGuard]),
        _i21.RouteConfig(HomepageScreenRoute.name, path: '/home', guards: [
          authGuard
        ], children: [
          _i21.RouteConfig(DiscoverTabRoute.name,
              path: '', parent: HomepageScreenRoute.name),
          _i21.RouteConfig(LikesTabRoute.name,
              path: 'likes',
              parent: HomepageScreenRoute.name,
              children: [
                _i21.RouteConfig(LikesReceivedTabRoute.name,
                    path: '', parent: LikesTabRoute.name),
                _i21.RouteConfig(LikesSentTabRoute.name,
                    path: 'sent', parent: LikesTabRoute.name)
              ]),
          _i21.RouteConfig(MatchesTabRoute.name,
              path: 'matches', parent: HomepageScreenRoute.name),
          _i21.RouteConfig(ProfileTabRoute.name,
              path: 'profile', parent: HomepageScreenRoute.name),
          _i21.RouteConfig('*#redirect',
>>>>>>> 518b5c4 (Adds like received and sent tabs)
              path: '*',
              parent: HomepageScreenRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
<<<<<<< HEAD
        _i16.RouteConfig(EditProfileRoute.name,
            path: 'edit_profile', guards: [authGuard]),
        _i16.RouteConfig(EmptyRouterPageRoute.name, path: 'help', guards: [
          authGuard
        ], children: [
          _i16.RouteConfig(HelpPageRoute.name,
              path: '', parent: EmptyRouterPageRoute.name),
          _i16.RouteConfig(WebviewRoute.name,
              path: 'webview', parent: EmptyRouterPageRoute.name)
        ]),
        _i16.RouteConfig(UpdatePreferencesRoute.name,
            path: 'update_preferences', guards: [authGuard]),
        _i16.RouteConfig(UpdateHometownRoute.name,
            path: '/edit_hometown', guards: [authGuard]),
        _i16.RouteConfig('*#redirect',
=======
        _i21.RouteConfig('*#redirect',
>>>>>>> 518b5c4 (Adds like received and sent tabs)
            path: '*', redirectTo: '/login', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
<<<<<<< HEAD
class SplashScreenRoute extends _i16.PageRouteInfo<void> {
=======
class SplashScreenRoute extends _i21.PageRouteInfo<void> {
>>>>>>> 518b5c4 (Adds like received and sent tabs)
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
<<<<<<< HEAD
class LoginScreenRoute extends _i16.PageRouteInfo<void> {
=======
class LoginScreenRoute extends _i21.PageRouteInfo<void> {
>>>>>>> 518b5c4 (Adds like received and sent tabs)
  const LoginScreenRoute() : super(LoginScreenRoute.name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.UpdateBirthdayScreen]
class UpdateBirthdayScreenRoute
<<<<<<< HEAD
    extends _i16.PageRouteInfo<UpdateBirthdayScreenRouteArgs> {
  UpdateBirthdayScreenRoute({_i25.Key? key, bool? redirectBack})
=======
    extends _i21.PageRouteInfo<UpdateBirthdayScreenRouteArgs> {
  UpdateBirthdayScreenRoute({_i22.Key? key, bool? redirectBack})
>>>>>>> 518b5c4 (Adds like received and sent tabs)
      : super(UpdateBirthdayScreenRoute.name,
            path: '/birthday',
            args: UpdateBirthdayScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'UpdateBirthdayScreenRoute';
}

class UpdateBirthdayScreenRouteArgs {
  const UpdateBirthdayScreenRouteArgs({this.key, this.redirectBack});

  final _i25.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'UpdateBirthdayScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i4.UpdateGenderScreen]
class UpdateGenderScreenRoute
    extends _i16.PageRouteInfo<UpdateGenderScreenRouteArgs> {
  UpdateGenderScreenRoute({_i25.Key? key, bool? redirectBack})
      : super(UpdateGenderScreenRoute.name,
            path: '/gender',
            args: UpdateGenderScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'UpdateGenderScreenRoute';
}

class UpdateGenderScreenRouteArgs {
  const UpdateGenderScreenRouteArgs({this.key, this.redirectBack});

  final _i25.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'UpdateGenderScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i5.UpdateInterestedGenderScreen]
class UpdateInterestedGenderScreenRoute
    extends _i16.PageRouteInfo<UpdateInterestedGenderScreenRouteArgs> {
  UpdateInterestedGenderScreenRoute({_i25.Key? key, bool? redirectBack})
      : super(UpdateInterestedGenderScreenRoute.name,
            path: '/interested_genders',
            args: UpdateInterestedGenderScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'UpdateInterestedGenderScreenRoute';
}

class UpdateInterestedGenderScreenRouteArgs {
  const UpdateInterestedGenderScreenRouteArgs({this.key, this.redirectBack});

  final _i25.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'UpdateInterestedGenderScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i6.UpdateWorkInformationScreen]
class UpdateWorkInformationScreenRoute
<<<<<<< HEAD
    extends _i16.PageRouteInfo<UpdateWorkInformationScreenRouteArgs> {
  UpdateWorkInformationScreenRoute({_i25.Key? key, bool? redirectBack})
=======
    extends _i21.PageRouteInfo<UpdateWorkInformationScreenRouteArgs> {
  UpdateWorkInformationScreenRoute({_i22.Key? key, bool? redirectBack})
>>>>>>> 518b5c4 (Adds like received and sent tabs)
      : super(UpdateWorkInformationScreenRoute.name,
            path: '/work_details',
            args: UpdateWorkInformationScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'UpdateWorkInformationScreenRoute';
}

class UpdateWorkInformationScreenRouteArgs {
  const UpdateWorkInformationScreenRouteArgs({this.key, this.redirectBack});

<<<<<<< HEAD
  final _i25.Key? key;
=======
  final _i22.Key? key;
>>>>>>> 518b5c4 (Adds like received and sent tabs)

  final bool? redirectBack;

  @override
  String toString() {
    return 'UpdateWorkInformationScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i7.EducationHistoryScreen]
class EducationHistoryScreenRoute
<<<<<<< HEAD
    extends _i16.PageRouteInfo<EducationHistoryScreenRouteArgs> {
  EducationHistoryScreenRoute({_i25.Key? key, bool? redirectBack})
=======
    extends _i21.PageRouteInfo<EducationHistoryScreenRouteArgs> {
  EducationHistoryScreenRoute({_i22.Key? key, bool? redirectBack})
>>>>>>> 518b5c4 (Adds like received and sent tabs)
      : super(EducationHistoryScreenRoute.name,
            path: '/education_history',
            args: EducationHistoryScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'EducationHistoryScreenRoute';
}

class EducationHistoryScreenRouteArgs {
  const EducationHistoryScreenRouteArgs({this.key, this.redirectBack});

<<<<<<< HEAD
  final _i25.Key? key;
=======
  final _i22.Key? key;
>>>>>>> 518b5c4 (Adds like received and sent tabs)

  final bool? redirectBack;

  @override
  String toString() {
    return 'EducationHistoryScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i8.LinkedinUrlScreen]
class LinkedinUrlScreenRoute
<<<<<<< HEAD
    extends _i16.PageRouteInfo<LinkedinUrlScreenRouteArgs> {
  LinkedinUrlScreenRoute({_i25.Key? key, bool? redirectBack})
=======
    extends _i21.PageRouteInfo<LinkedinUrlScreenRouteArgs> {
  LinkedinUrlScreenRoute({_i22.Key? key, bool? redirectBack})
>>>>>>> 518b5c4 (Adds like received and sent tabs)
      : super(LinkedinUrlScreenRoute.name,
            path: '/linkedin_url',
            args: LinkedinUrlScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'LinkedinUrlScreenRoute';
}

class LinkedinUrlScreenRouteArgs {
  const LinkedinUrlScreenRouteArgs({this.key, this.redirectBack});

<<<<<<< HEAD
  final _i25.Key? key;
=======
  final _i22.Key? key;
>>>>>>> 518b5c4 (Adds like received and sent tabs)

  final bool? redirectBack;

  @override
  String toString() {
    return 'LinkedinUrlScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i9.UploadImagesScreen]
<<<<<<< HEAD
class UploadImagesScreenRoute extends _i16.PageRouteInfo<void> {
=======
class UploadImagesScreenRoute extends _i21.PageRouteInfo<void> {
>>>>>>> 518b5c4 (Adds like received and sent tabs)
  const UploadImagesScreenRoute()
      : super(UploadImagesScreenRoute.name, path: '/images');

  static const String name = 'UploadImagesScreenRoute';
}

/// generated route for
/// [_i10.SelfieVerificationScreen]
class SelfieVerificationScreenRoute
<<<<<<< HEAD
    extends _i16.PageRouteInfo<SelfieVerificationScreenRouteArgs> {
  SelfieVerificationScreenRoute({_i25.Key? key, bool? redirectBack})
=======
    extends _i21.PageRouteInfo<SelfieVerificationScreenRouteArgs> {
  SelfieVerificationScreenRoute({_i22.Key? key, bool? redirectBack})
>>>>>>> 518b5c4 (Adds like received and sent tabs)
      : super(SelfieVerificationScreenRoute.name,
            path: '/selfie_verification',
            args: SelfieVerificationScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'SelfieVerificationScreenRoute';
}

class SelfieVerificationScreenRouteArgs {
  const SelfieVerificationScreenRouteArgs({this.key, this.redirectBack});

<<<<<<< HEAD
  final _i25.Key? key;
=======
  final _i22.Key? key;
>>>>>>> 518b5c4 (Adds like received and sent tabs)

  final bool? redirectBack;

  @override
  String toString() {
    return 'SelfieVerificationScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i11.IdentityVerificationScreen]
class IdentityVerificationScreenRoute
<<<<<<< HEAD
    extends _i16.PageRouteInfo<IdentityVerificationScreenRouteArgs> {
  IdentityVerificationScreenRoute({_i25.Key? key, bool? redirectBack})
=======
    extends _i21.PageRouteInfo<IdentityVerificationScreenRouteArgs> {
  IdentityVerificationScreenRoute({_i22.Key? key, bool? redirectBack})
>>>>>>> 518b5c4 (Adds like received and sent tabs)
      : super(IdentityVerificationScreenRoute.name,
            path: '/identity_verification',
            args: IdentityVerificationScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'IdentityVerificationScreenRoute';
}

class IdentityVerificationScreenRouteArgs {
  const IdentityVerificationScreenRouteArgs({this.key, this.redirectBack});

<<<<<<< HEAD
  final _i25.Key? key;
=======
  final _i22.Key? key;
>>>>>>> 518b5c4 (Adds like received and sent tabs)

  final bool? redirectBack;

  @override
  String toString() {
    return 'IdentityVerificationScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// generated route for
/// [_i12.UnderVerification]
<<<<<<< HEAD
class UnderVerificationRoute extends _i16.PageRouteInfo<void> {
=======
class UnderVerificationRoute extends _i21.PageRouteInfo<void> {
>>>>>>> 518b5c4 (Adds like received and sent tabs)
  const UnderVerificationRoute()
      : super(UnderVerificationRoute.name, path: '/under_verification');

  static const String name = 'UnderVerificationRoute';
}

/// generated route for
/// [_i13.VerificationRejected]
<<<<<<< HEAD
class VerificationRejectedRoute extends _i16.PageRouteInfo<void> {
=======
class VerificationRejectedRoute extends _i21.PageRouteInfo<void> {
>>>>>>> 518b5c4 (Adds like received and sent tabs)
  const VerificationRejectedRoute()
      : super(VerificationRejectedRoute.name, path: '/rejected');

  static const String name = 'VerificationRejectedRoute';
}

/// generated route for
/// [_i14.HomepageScreen]
class HomepageScreenRoute extends _i16.PageRouteInfo<void> {
  const HomepageScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(HomepageScreenRoute.name,
            path: '/home', initialChildren: children);

  static const String name = 'HomepageScreenRoute';
}

/// generated route for
/// [_i15.EditProfile]
class EditProfileRoute extends _i16.PageRouteInfo<void> {
  const EditProfileRoute() : super(EditProfileRoute.name, path: 'edit_profile');

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i16.EmptyRouterPage]
class EmptyRouterPageRoute extends _i16.PageRouteInfo<void> {
  const EmptyRouterPageRoute({List<_i16.PageRouteInfo>? children})
      : super(EmptyRouterPageRoute.name,
            path: 'help', initialChildren: children);

  static const String name = 'EmptyRouterPageRoute';
}

/// generated route for
/// [_i17.UpdatePreferences]
class UpdatePreferencesRoute extends _i16.PageRouteInfo<void> {
  const UpdatePreferencesRoute()
      : super(UpdatePreferencesRoute.name, path: 'update_preferences');

  static const String name = 'UpdatePreferencesRoute';
}

/// generated route for
/// [_i18.UpdateHometown]
class UpdateHometownRoute extends _i16.PageRouteInfo<void> {
  const UpdateHometownRoute()
      : super(UpdateHometownRoute.name, path: '/edit_hometown');

  static const String name = 'UpdateHometownRoute';
}

/// generated route for
/// [_i19.DiscoverTab]
class DiscoverTabRoute extends _i16.PageRouteInfo<void> {
  const DiscoverTabRoute() : super(DiscoverTabRoute.name, path: '');

  static const String name = 'DiscoverTabRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i20.LikesTab]
class LikesTabRoute extends _i16.PageRouteInfo<void> {
  const LikesTabRoute() : super(LikesTabRoute.name, path: 'likes');
=======
/// [_i16.LikesTab]
class LikesTabRoute extends _i21.PageRouteInfo<void> {
  const LikesTabRoute({List<_i21.PageRouteInfo>? children})
      : super(LikesTabRoute.name, path: 'likes', initialChildren: children);
>>>>>>> 518b5c4 (Adds like received and sent tabs)

  static const String name = 'LikesTabRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i21.MatchesTab]
class MatchesTabRoute extends _i16.PageRouteInfo<void> {
=======
/// [_i17.MatchesTab]
class MatchesTabRoute extends _i21.PageRouteInfo<void> {
>>>>>>> 518b5c4 (Adds like received and sent tabs)
  const MatchesTabRoute() : super(MatchesTabRoute.name, path: 'matches');

  static const String name = 'MatchesTabRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i22.ProfileTab]
class ProfileTabRoute extends _i16.PageRouteInfo<void> {
=======
/// [_i18.ProfileTab]
class ProfileTabRoute extends _i21.PageRouteInfo<void> {
>>>>>>> 518b5c4 (Adds like received and sent tabs)
  const ProfileTabRoute() : super(ProfileTabRoute.name, path: 'profile');

  static const String name = 'ProfileTabRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i23.HelpPage]
class HelpPageRoute extends _i16.PageRouteInfo<HelpPageRouteArgs> {
  HelpPageRoute({_i25.Key? key})
      : super(HelpPageRoute.name, path: '', args: HelpPageRouteArgs(key: key));

  static const String name = 'HelpPageRoute';
}

class HelpPageRouteArgs {
  const HelpPageRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'HelpPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i24.Webview]
class WebviewRoute extends _i16.PageRouteInfo<WebviewRouteArgs> {
  WebviewRoute({_i25.Key? key, String? url})
      : super(WebviewRoute.name,
            path: 'webview',
            args: WebviewRouteArgs(key: key, url: url),
            rawQueryParams: {'url': url});

  static const String name = 'WebviewRoute';
}

class WebviewRouteArgs {
  const WebviewRouteArgs({this.key, this.url});

  final _i25.Key? key;

  final String? url;

  @override
  String toString() {
    return 'WebviewRouteArgs{key: $key, url: $url}';
  }
=======
/// [_i19.LikesReceivedTab]
class LikesReceivedTabRoute extends _i21.PageRouteInfo<void> {
  const LikesReceivedTabRoute() : super(LikesReceivedTabRoute.name, path: '');

  static const String name = 'LikesReceivedTabRoute';
}

/// generated route for
/// [_i20.LikesSentTab]
class LikesSentTabRoute extends _i21.PageRouteInfo<void> {
  const LikesSentTabRoute() : super(LikesSentTabRoute.name, path: 'sent');

  static const String name = 'LikesSentTabRoute';
>>>>>>> 518b5c4 (Adds like received and sent tabs)
}
