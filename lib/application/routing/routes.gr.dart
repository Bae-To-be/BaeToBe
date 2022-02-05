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
import 'package:baetobe/application/routing/auth_guard.dart' as _i33;
import 'package:baetobe/entities/match.dart' as _i34;
import 'package:baetobe/entities/user_profile.dart' as _i35;
import 'package:baetobe/screens/boot/splash_screen.dart' as _i1;
import 'package:baetobe/screens/help_article_screen.dart' as _i31;
import 'package:baetobe/screens/home/discover_tab.dart' as _i24;
import 'package:baetobe/screens/home/likes/likes_received_tab.dart' as _i28;
import 'package:baetobe/screens/home/likes/likes_sent_tab.dart' as _i29;
import 'package:baetobe/screens/home/likes_tab.dart' as _i25;
import 'package:baetobe/screens/home/matches/messages_for_match_screen.dart'
    as _i15;
import 'package:baetobe/screens/home/matches_tab.dart' as _i26;
import 'package:baetobe/screens/home/profile_tab.dart' as _i27;
import 'package:baetobe/screens/homepage_screen.dart' as _i17;
import 'package:baetobe/screens/kyc/under_verification_screen.dart' as _i12;
import 'package:baetobe/screens/kyc/verification_rejected_screen.dart' as _i13;
import 'package:baetobe/screens/login_screen.dart' as _i2;
import 'package:baetobe/screens/profile_screens/edit_profile_page.dart' as _i18;
import 'package:baetobe/screens/profile_screens/help_page.dart' as _i30;
import 'package:baetobe/screens/profile_screens/update_preferences_page.dart'
    as _i20;
import 'package:baetobe/screens/update_update/education_history_screen.dart'
    as _i7;
import 'package:baetobe/screens/update_update/identity_verification_screen.dart'
    as _i11;
import 'package:baetobe/screens/update_update/linkedin_url_screen.dart' as _i8;
import 'package:baetobe/screens/update_update/selfie_verification_screen.dart'
    as _i10;
import 'package:baetobe/screens/update_update/update_birthday_screen.dart'
    as _i3;
import 'package:baetobe/screens/update_update/update_gender_screen.dart' as _i4;
import 'package:baetobe/screens/update_update/update_height_screen.dart'
    as _i23;
import 'package:baetobe/screens/update_update/update_hometown_screen.dart'
    as _i21;
import 'package:baetobe/screens/update_update/update_interested_gender_screen.dart'
    as _i5;
import 'package:baetobe/screens/update_update/update_religion_screen.dart'
    as _i22;
import 'package:baetobe/screens/update_update/update_work_information_screen.dart'
    as _i6;
import 'package:baetobe/screens/update_update/upload_images_screen.dart' as _i9;
import 'package:baetobe/screens/user_profile/report_user_screen.dart' as _i16;
import 'package:baetobe/screens/user_profile/user_profile_screen.dart' as _i14;
import 'package:flutter/material.dart' as _i32;

class AppRouter extends _i19.RootStackRouter {
  AppRouter(
      {_i32.GlobalKey<_i32.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i33.AuthGuard authGuard;

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
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<UpdateGenderScreenRouteArgs>(
          orElse: () => UpdateGenderScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.UpdateGenderScreen(
              key: args.key, redirectBack: args.redirectBack));
    },
    UpdateInterestedGenderScreenRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<UpdateInterestedGenderScreenRouteArgs>(
          orElse: () => UpdateInterestedGenderScreenRouteArgs(
              redirectBack: queryParams.optBool('redirectBack')));
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i5.UpdateInterestedGenderScreen(
              key: args.key, redirectBack: args.redirectBack));
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
    UnderVerificationScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.UnderVerificationScreen());
    },
    VerificationRejectedScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.VerificationRejectedScreen());
    },
    UserProfileScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UserProfileScreenRouteArgs>(
          orElse: () =>
              UserProfileScreenRouteArgs(id: pathParams.getInt('id')));
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i14.UserProfileScreen(key: args.key, id: args.id));
    },
    MessagesForMatchScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MessagesForMatchScreenRouteArgs>();
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i15.MessagesForMatchScreen(key: args.key, match: args.match));
    },
    ReportUserScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ReportUserScreenRouteArgs>();
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i16.ReportUserScreen(key: args.key, profile: args.profile));
    },
    HomepageScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i17.HomepageScreen());
    },
    EditProfilePageRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i18.EditProfilePage());
    },
    EmptyRouterPageRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i19.EmptyRouterPage());
    },
    UpdatePreferencesRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i20.UpdatePreferences());
    },
    UpdateHometownScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i21.UpdateHometownScreen());
    },
    UpdateReligionScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i22.UpdateReligionScreen());
    },
    UpdateHeightScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i23.UpdateHeightScreen());
    },
    DiscoverTabRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i24.DiscoverTab());
    },
    LikesTabRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i25.LikesTab());
    },
    MatchesTabRoute.name: (routeData) {
      final args = routeData.argsAs<MatchesTabRouteArgs>(
          orElse: () => const MatchesTabRouteArgs());
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: _i26.MatchesTab(key: args.key));
    },
    ProfileTabRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i27.ProfileTab());
    },
    LikesReceivedTabRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i28.LikesReceivedTab());
    },
    LikesSentTabRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i29.LikesSentTab());
    },
    HelpPageRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i30.HelpPage());
    },
    HelpArticleScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<HelpArticleScreenRouteArgs>(
          orElse: () =>
              HelpArticleScreenRouteArgs(id: pathParams.getString('id')));
      return _i19.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i31.HelpArticleScreen(key: args.key, id: args.id));
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
        _i19.RouteConfig(UnderVerificationScreenRoute.name,
            path: '/under_verification', guards: [authGuard]),
        _i19.RouteConfig(VerificationRejectedScreenRoute.name,
            path: '/rejected', guards: [authGuard]),
        _i19.RouteConfig(UserProfileScreenRoute.name,
            path: '/profile_details/:id', guards: [authGuard]),
        _i19.RouteConfig(MessagesForMatchScreenRoute.name,
            path: '/matches/messages', guards: [authGuard]),
        _i19.RouteConfig(ReportUserScreenRoute.name,
            path: '/users/report', guards: [authGuard]),
        _i19.RouteConfig(HomepageScreenRoute.name, path: '/home', guards: [
          authGuard
        ], children: [
          _i19.RouteConfig(DiscoverTabRoute.name,
              path: '', parent: HomepageScreenRoute.name),
          _i19.RouteConfig(LikesTabRoute.name,
              path: 'likes',
              parent: HomepageScreenRoute.name,
              children: [
                _i19.RouteConfig(LikesReceivedTabRoute.name,
                    path: '', parent: LikesTabRoute.name),
                _i19.RouteConfig(LikesSentTabRoute.name,
                    path: 'sent', parent: LikesTabRoute.name),
                _i19.RouteConfig('*#redirect',
                    path: '*',
                    parent: LikesTabRoute.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
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
        _i19.RouteConfig(EditProfilePageRoute.name,
            path: 'edit_profile', guards: [authGuard]),
        _i19.RouteConfig(EmptyRouterPageRoute.name, path: 'help', guards: [
          authGuard
        ], children: [
          _i19.RouteConfig(HelpPageRoute.name,
              path: '', parent: EmptyRouterPageRoute.name),
          _i19.RouteConfig(HelpArticleScreenRoute.name,
              path: ':id', parent: EmptyRouterPageRoute.name)
        ]),
        _i19.RouteConfig(UpdatePreferencesRoute.name,
            path: 'update_preferences', guards: [authGuard]),
        _i19.RouteConfig(UpdateHometownScreenRoute.name,
            path: '/edit_hometown', guards: [authGuard]),
        _i19.RouteConfig(UpdateReligionScreenRoute.name,
            path: '/edit_religion', guards: [authGuard]),
        _i19.RouteConfig(UpdateHeightScreenRoute.name,
            path: '/edit_height', guards: [authGuard]),
        _i19.RouteConfig('*#redirect',
            path: '*', redirectTo: '/login', fullMatch: true)
      ];
}

/// data route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i19.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// data route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i19.PageRouteInfo<void> {
  const LoginScreenRoute() : super(LoginScreenRoute.name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// data route for
/// [_i3.UpdateBirthdayScreen]
class UpdateBirthdayScreenRoute
    extends _i19.PageRouteInfo<UpdateBirthdayScreenRouteArgs> {
  UpdateBirthdayScreenRoute({_i32.Key? key, bool? redirectBack})
      : super(UpdateBirthdayScreenRoute.name,
            path: '/birthday',
            args: UpdateBirthdayScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'UpdateBirthdayScreenRoute';
}

class UpdateBirthdayScreenRouteArgs {
  const UpdateBirthdayScreenRouteArgs({this.key, this.redirectBack});

  final _i32.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'UpdateBirthdayScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// data route for
/// [_i4.UpdateGenderScreen]
class UpdateGenderScreenRoute
    extends _i19.PageRouteInfo<UpdateGenderScreenRouteArgs> {
  UpdateGenderScreenRoute({_i32.Key? key, bool? redirectBack})
      : super(UpdateGenderScreenRoute.name,
            path: '/gender',
            args: UpdateGenderScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'UpdateGenderScreenRoute';
}

class UpdateGenderScreenRouteArgs {
  const UpdateGenderScreenRouteArgs({this.key, this.redirectBack});

  final _i32.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'UpdateGenderScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// data route for
/// [_i5.UpdateInterestedGenderScreen]
class UpdateInterestedGenderScreenRoute
    extends _i19.PageRouteInfo<UpdateInterestedGenderScreenRouteArgs> {
  UpdateInterestedGenderScreenRoute({_i32.Key? key, bool? redirectBack})
      : super(UpdateInterestedGenderScreenRoute.name,
            path: '/interested_genders',
            args: UpdateInterestedGenderScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'UpdateInterestedGenderScreenRoute';
}

class UpdateInterestedGenderScreenRouteArgs {
  const UpdateInterestedGenderScreenRouteArgs({this.key, this.redirectBack});

  final _i32.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'UpdateInterestedGenderScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// data route for
/// [_i6.UpdateWorkInformationScreen]
class UpdateWorkInformationScreenRoute
    extends _i19.PageRouteInfo<UpdateWorkInformationScreenRouteArgs> {
  UpdateWorkInformationScreenRoute({_i32.Key? key, bool? redirectBack})
      : super(UpdateWorkInformationScreenRoute.name,
            path: '/work_details',
            args: UpdateWorkInformationScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'UpdateWorkInformationScreenRoute';
}

class UpdateWorkInformationScreenRouteArgs {
  const UpdateWorkInformationScreenRouteArgs({this.key, this.redirectBack});

  final _i32.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'UpdateWorkInformationScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// data route for
/// [_i7.EducationHistoryScreen]
class EducationHistoryScreenRoute
    extends _i19.PageRouteInfo<EducationHistoryScreenRouteArgs> {
  EducationHistoryScreenRoute({_i32.Key? key, bool? redirectBack})
      : super(EducationHistoryScreenRoute.name,
            path: '/education_history',
            args: EducationHistoryScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'EducationHistoryScreenRoute';
}

class EducationHistoryScreenRouteArgs {
  const EducationHistoryScreenRouteArgs({this.key, this.redirectBack});

  final _i32.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'EducationHistoryScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// data route for
/// [_i8.LinkedinUrlScreen]
class LinkedinUrlScreenRoute
    extends _i19.PageRouteInfo<LinkedinUrlScreenRouteArgs> {
  LinkedinUrlScreenRoute({_i32.Key? key, bool? redirectBack})
      : super(LinkedinUrlScreenRoute.name,
            path: '/linkedin_url',
            args: LinkedinUrlScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'LinkedinUrlScreenRoute';
}

class LinkedinUrlScreenRouteArgs {
  const LinkedinUrlScreenRouteArgs({this.key, this.redirectBack});

  final _i32.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'LinkedinUrlScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// data route for
/// [_i9.UploadImagesScreen]
class UploadImagesScreenRoute extends _i19.PageRouteInfo<void> {
  const UploadImagesScreenRoute()
      : super(UploadImagesScreenRoute.name, path: '/images');

  static const String name = 'UploadImagesScreenRoute';
}

/// data route for
/// [_i10.SelfieVerificationScreen]
class SelfieVerificationScreenRoute
    extends _i19.PageRouteInfo<SelfieVerificationScreenRouteArgs> {
  SelfieVerificationScreenRoute({_i32.Key? key, bool? redirectBack})
      : super(SelfieVerificationScreenRoute.name,
            path: '/selfie_verification',
            args: SelfieVerificationScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'SelfieVerificationScreenRoute';
}

class SelfieVerificationScreenRouteArgs {
  const SelfieVerificationScreenRouteArgs({this.key, this.redirectBack});

  final _i32.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'SelfieVerificationScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// data route for
/// [_i11.IdentityVerificationScreen]
class IdentityVerificationScreenRoute
    extends _i19.PageRouteInfo<IdentityVerificationScreenRouteArgs> {
  IdentityVerificationScreenRoute({_i32.Key? key, bool? redirectBack})
      : super(IdentityVerificationScreenRoute.name,
            path: '/identity_verification',
            args: IdentityVerificationScreenRouteArgs(
                key: key, redirectBack: redirectBack),
            rawQueryParams: {'redirectBack': redirectBack});

  static const String name = 'IdentityVerificationScreenRoute';
}

class IdentityVerificationScreenRouteArgs {
  const IdentityVerificationScreenRouteArgs({this.key, this.redirectBack});

  final _i32.Key? key;

  final bool? redirectBack;

  @override
  String toString() {
    return 'IdentityVerificationScreenRouteArgs{key: $key, redirectBack: $redirectBack}';
  }
}

/// data route for
/// [_i12.UnderVerificationScreen]
class UnderVerificationScreenRoute extends _i19.PageRouteInfo<void> {
  const UnderVerificationScreenRoute()
      : super(UnderVerificationScreenRoute.name, path: '/under_verification');

  static const String name = 'UnderVerificationScreenRoute';
}

/// data route for
/// [_i13.VerificationRejectedScreen]
class VerificationRejectedScreenRoute extends _i19.PageRouteInfo<void> {
  const VerificationRejectedScreenRoute()
      : super(VerificationRejectedScreenRoute.name, path: '/rejected');

  static const String name = 'VerificationRejectedScreenRoute';
}

/// data route for
/// [_i14.UserProfileScreen]
class UserProfileScreenRoute
    extends _i19.PageRouteInfo<UserProfileScreenRouteArgs> {
  UserProfileScreenRoute({_i32.Key? key, required int id})
      : super(UserProfileScreenRoute.name,
            path: '/profile_details/:id',
            args: UserProfileScreenRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'UserProfileScreenRoute';
}

class UserProfileScreenRouteArgs {
  const UserProfileScreenRouteArgs({this.key, required this.id});

  final _i32.Key? key;

  final int id;

  @override
  String toString() {
    return 'UserProfileScreenRouteArgs{key: $key, id: $id}';
  }
}

/// data route for
/// [_i15.MessagesForMatchScreen]
class MessagesForMatchScreenRoute
    extends _i19.PageRouteInfo<MessagesForMatchScreenRouteArgs> {
  MessagesForMatchScreenRoute({_i32.Key? key, required _i34.Match match})
      : super(MessagesForMatchScreenRoute.name,
            path: '/matches/messages',
            args: MessagesForMatchScreenRouteArgs(key: key, match: match));

  static const String name = 'MessagesForMatchScreenRoute';
}

class MessagesForMatchScreenRouteArgs {
  const MessagesForMatchScreenRouteArgs({this.key, required this.match});

  final _i32.Key? key;

  final _i34.Match match;

  @override
  String toString() {
    return 'MessagesForMatchScreenRouteArgs{key: $key, match: $match}';
  }
}

/// data route for
/// [_i16.ReportUserScreen]
class ReportUserScreenRoute
    extends _i19.PageRouteInfo<ReportUserScreenRouteArgs> {
  ReportUserScreenRoute({_i32.Key? key, required _i35.DetailedProfile profile})
      : super(ReportUserScreenRoute.name,
            path: '/users/report',
            args: ReportUserScreenRouteArgs(key: key, profile: profile));

  static const String name = 'ReportUserScreenRoute';
}

class ReportUserScreenRouteArgs {
  const ReportUserScreenRouteArgs({this.key, required this.profile});

  final _i32.Key? key;

  final _i35.DetailedProfile profile;

  @override
  String toString() {
    return 'ReportUserScreenRouteArgs{key: $key, profile: $profile}';
  }
}

/// data route for
/// [_i17.HomepageScreen]
class HomepageScreenRoute extends _i19.PageRouteInfo<void> {
  const HomepageScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(HomepageScreenRoute.name,
            path: '/home', initialChildren: children);

  static const String name = 'HomepageScreenRoute';
}

/// data route for
/// [_i18.EditProfilePage]
class EditProfilePageRoute extends _i19.PageRouteInfo<void> {
  const EditProfilePageRoute()
      : super(EditProfilePageRoute.name, path: 'edit_profile');

  static const String name = 'EditProfilePageRoute';
}

/// data route for
/// [_i19.EmptyRouterPage]
class EmptyRouterPageRoute extends _i19.PageRouteInfo<void> {
  const EmptyRouterPageRoute({List<_i19.PageRouteInfo>? children})
      : super(EmptyRouterPageRoute.name,
            path: 'help', initialChildren: children);

  static const String name = 'EmptyRouterPageRoute';
}

/// data route for
/// [_i20.UpdatePreferences]
class UpdatePreferencesRoute extends _i19.PageRouteInfo<void> {
  const UpdatePreferencesRoute()
      : super(UpdatePreferencesRoute.name, path: 'update_preferences');

  static const String name = 'UpdatePreferencesRoute';
}

/// data route for
/// [_i21.UpdateHometownScreen]
class UpdateHometownScreenRoute extends _i19.PageRouteInfo<void> {
  const UpdateHometownScreenRoute()
      : super(UpdateHometownScreenRoute.name, path: '/edit_hometown');

  static const String name = 'UpdateHometownScreenRoute';
}

/// data route for
/// [_i22.UpdateReligionScreen]
class UpdateReligionScreenRoute extends _i19.PageRouteInfo<void> {
  const UpdateReligionScreenRoute()
      : super(UpdateReligionScreenRoute.name, path: '/edit_religion');

  static const String name = 'UpdateReligionScreenRoute';
}

/// data route for
/// [_i23.UpdateHeightScreen]
class UpdateHeightScreenRoute extends _i19.PageRouteInfo<void> {
  const UpdateHeightScreenRoute()
      : super(UpdateHeightScreenRoute.name, path: '/edit_height');

  static const String name = 'UpdateHeightScreenRoute';
}

/// data route for
/// [_i24.DiscoverTab]
class DiscoverTabRoute extends _i19.PageRouteInfo<void> {
  const DiscoverTabRoute() : super(DiscoverTabRoute.name, path: '');

  static const String name = 'DiscoverTabRoute';
}

/// data route for
/// [_i25.LikesTab]
class LikesTabRoute extends _i19.PageRouteInfo<void> {
  const LikesTabRoute({List<_i19.PageRouteInfo>? children})
      : super(LikesTabRoute.name, path: 'likes', initialChildren: children);

  static const String name = 'LikesTabRoute';
}

/// data route for
/// [_i26.MatchesTab]
class MatchesTabRoute extends _i19.PageRouteInfo<MatchesTabRouteArgs> {
  MatchesTabRoute({_i32.Key? key})
      : super(MatchesTabRoute.name,
            path: 'matches', args: MatchesTabRouteArgs(key: key));

  static const String name = 'MatchesTabRoute';
}

class MatchesTabRouteArgs {
  const MatchesTabRouteArgs({this.key});

  final _i32.Key? key;

  @override
  String toString() {
    return 'MatchesTabRouteArgs{key: $key}';
  }
}

/// data route for
/// [_i27.ProfileTab]
class ProfileTabRoute extends _i19.PageRouteInfo<void> {
  const ProfileTabRoute() : super(ProfileTabRoute.name, path: 'profile');

  static const String name = 'ProfileTabRoute';
}

/// data route for
/// [_i28.LikesReceivedTab]
class LikesReceivedTabRoute extends _i19.PageRouteInfo<void> {
  const LikesReceivedTabRoute() : super(LikesReceivedTabRoute.name, path: '');

  static const String name = 'LikesReceivedTabRoute';
}

/// data route for
/// [_i29.LikesSentTab]
class LikesSentTabRoute extends _i19.PageRouteInfo<void> {
  const LikesSentTabRoute() : super(LikesSentTabRoute.name, path: 'sent');

  static const String name = 'LikesSentTabRoute';
}

/// data route for
/// [_i30.HelpPage]
class HelpPageRoute extends _i19.PageRouteInfo<void> {
  const HelpPageRoute() : super(HelpPageRoute.name, path: '');

  static const String name = 'HelpPageRoute';
}

/// data route for
/// [_i31.HelpArticleScreen]
class HelpArticleScreenRoute
    extends _i19.PageRouteInfo<HelpArticleScreenRouteArgs> {
  HelpArticleScreenRoute({_i32.Key? key, required String id})
      : super(HelpArticleScreenRoute.name,
            path: ':id',
            args: HelpArticleScreenRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'HelpArticleScreenRoute';
}

class HelpArticleScreenRouteArgs {
  const HelpArticleScreenRouteArgs({this.key, required this.id});

  final _i32.Key? key;

  final String id;

  @override
  String toString() {
    return 'HelpArticleScreenRouteArgs{key: $key, id: $id}';
  }
}
