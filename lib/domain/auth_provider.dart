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
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<AuthInformation>>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<AsyncValue<AuthInformation>> {
  GoogleSignIn? googleSignIn;
  final Ref ref;
  AuthNotifier(this.ref) : super(const AsyncValue.loading()) {
    attachGoogleCallbacks().then((_) => loadFromStorage()).then((_) {
      if (state.value == null) {
        state = AsyncValue.data(AuthInformation('', '', 100, DateTime.now()));
      }
    }).catchError((error, stacktrace) {
      state = AsyncValue.error(error, stackTrace: stacktrace);
    });
  }

  bool isLoading() {
    return (state is AsyncLoading);
  }

  Future<void> attachGoogleCallbacks() async {
    state = const AsyncValue.loading();
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
            await _authenticateUser(LoginProviders.google, gKey.idToken!);
          }
        } catch (e, stacktrace) {
          await FirebaseCrashlytics.instance.recordError(e, stacktrace);
          _error.updateError(ErrorMessages.somethingWentWrong);
        }
      }
    });
    try {
      await googleSignIn?.signInSilently();
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, stacktrace);
      _error.updateError(ErrorMessages.somethingWentWrong);
      state = AsyncValue.error(e, stackTrace: stacktrace);
    }
  }

  Future<void> loginWithFacebook() async {
    state = const AsyncValue.loading();
    final _error = ref.read(errorProvider.notifier);
    final _router = ref.read(routerProvider);
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        await _authenticateUser(
            LoginProviders.facebook, result.accessToken!.token);
        await _router.replaceNamed(AppLinks.homePage);
      } else {
        state = AsyncValue.error(Exception(result.message));
        _error.updateError(
          result.message ?? ErrorMessages.somethingWentWrong,
        );
      }
    } on DioError catch (e) {
      _error.updateError(
          e.response?.data?['error'] ?? ErrorMessages.somethingWentWrong);
      state = AsyncValue.error(e);
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, null);
      _error.updateError(ErrorMessages.somethingWentWrong);
      state = AsyncValue.error(e, stackTrace: stacktrace);
    }
  }

  Future<void> loginWithGoogle() async {
    state = const AsyncValue.loading();
    final _router = ref.read(routerProvider);
    final _error = ref.read(errorProvider.notifier);
    try {
      await googleSignIn?.signIn();
      await _router.replaceNamed(AppLinks.homePage);
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, stacktrace);
      _error.updateError(ErrorMessages.somethingWentWrong);
      state = AsyncValue.error(e, stackTrace: stacktrace);
    }
  }

  Future<void> _authenticateUser(
      String loginMethod, String providerToken) async {
    final client = ref.read(authNetworkClientProvider);
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
      state = AsyncValue.data(AuthInformation(
        response.data['data']['access_token'],
        response.data['data']['refresh_token'],
        response.data['data']['expires_in'] as int,
        DateTime.now(),
      ));
      await Future.wait([
        _storage.write(key: StorageKeys.auth, value: jsonEncode(state.value)),
        _analyticsEvent(
            response.data['data']['is_new_user'] as bool, loginMethod)
      ]);
    } on DioError catch (e) {
      _error.updateError(
          e.response?.data?['error'] ?? ErrorMessages.somethingWentWrong);
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, stacktrace);
      _error.updateError(ErrorMessages.somethingWentWrong);
      state = AsyncValue.error(e, stackTrace: stacktrace);
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
    state = AsyncValue.data(AuthInformation.fromJson(jsonDecode(value)));
  }
}
