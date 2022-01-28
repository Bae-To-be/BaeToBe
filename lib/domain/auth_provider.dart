import 'dart:convert';
import 'dart:io' show Platform;

import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/auth_information.dart';
import 'package:baetobe/infrastructure/network_service.dart';
import 'package:baetobe/infrastructure/secure_storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = FutureProvider<AuthNotifier>((ref) async {
  final auth = AuthNotifier(ref);
  await auth.attachGoogleCallbacks();
  await auth.loadFromStorage();
  return auth;
});

class AuthNotifier extends StateNotifier<AuthInformation> {
  GoogleSignIn? googleSignIn;
  final Ref ref;
  AuthNotifier(this.ref) : super(AuthInformation('', '', 100, DateTime.now()));

  Future<void> attachGoogleCallbacks() async {
    final _error = ref.read(errorProvider.notifier);

    googleSignIn = GoogleSignIn(
      clientId: RemoteConfig.instance.getString(RemoteConfigs.googleClientId),
      scopes: [
        'profile',
        'email',
      ],
    );

    googleSignIn?.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      if (account != null) {
        try {
          await account.clearAuthCache();
          GoogleSignInAuthentication gKey = await account.authentication;
          if (gKey.idToken == null) {
            // await logout();
          } else {
            await _authenticateUser('google', gKey.idToken!);
          }
        } catch (e, stacktrace) {
          await FirebaseCrashlytics.instance.recordError(e, stacktrace);
          _error.updateError(ErrorBodies.somethingWentWrong);
        }
      }
    });

    try {
      await googleSignIn?.signInSilently();
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, stacktrace);
      _error.updateError(ErrorBodies.somethingWentWrong);
    }
  }

  void loginWithFacebook() {}

  Future<void> loginWithGoogle(BuildContext ctx) async {
    final _error = ref.read(errorProvider.notifier);
    try {
      await googleSignIn?.signIn();
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, stacktrace);
      _error.updateError(ErrorBodies.somethingWentWrong);
    }
  }

  Future<void> _authenticateUser(
      String loginMethod, String providerToken) async {
    final client = ref.read(authNetworkClientProvider);
    final _appRouter = ref.read(routerProvider);
    final _error = ref.read(errorProvider.notifier);
    final _storage = ref.read(secureStorageProvider);
    try {
      final response = await client.post(BackendRoutes.authorize, data: {
        'auth_method': loginMethod,
        'platform': Platform.isAndroid
            ? PlatformConstants.android
            : PlatformConstants.ios,
        'token': providerToken,
      });
      state = AuthInformation(
        response.data['data']['access_token'],
        response.data['data']['refresh_token'],
        response.data['data']['expires_in'] as int,
        DateTime.now(),
      );
      await Future.wait([
        _storage.write(key: StorageKeys.auth, value: jsonEncode(state)),
        _analyticsEvent(
            response.data['data']['is_new_user'] as bool, loginMethod)
      ]);
      await _appRouter.pushNamed(AppLinks.homePage);
    } on DioError catch (e) {
      _error.updateError(
          e.response?.data?['error'] ?? ErrorBodies.somethingWentWrong);
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, stacktrace);
      _error.updateError(ErrorBodies.somethingWentWrong);
    }
  }

  Future<void> _analyticsEvent(bool isNewLogin, String loginMethod) {
    if (isNewLogin) {
      return FirebaseAnalytics.instance.logSignUp(signUpMethod: loginMethod);
    }

    return FirebaseAnalytics.instance.logLogin(loginMethod: loginMethod);
  }

  Future<void> loadFromStorage() async {
    final _storage = ref.read(secureStorageProvider);
    String? value = await _storage.read(key: StorageKeys.auth);
    if (value == null) {
      return;
    }
    state = AuthInformation.fromJson(jsonDecode(value));
  }
}
