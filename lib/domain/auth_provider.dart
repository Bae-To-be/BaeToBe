import 'dart:convert';
import 'dart:io';

import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/domain/post_login_route.dart';
import 'package:baetobe/entities/auth_information.dart';
import 'package:baetobe/infrastructure/location_service.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:baetobe/infrastructure/notifications_service.dart';
import 'package:baetobe/infrastructure/secure_storage_provider.dart';
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
    final router = ref.read(routerProvider);

    initialize().then((_) {
      if (state.value == null) {
        state = AsyncValue.data(AuthInformation('', '', 100, DateTime.now()));
        router.replaceNamed(AppLinks.login);
      }
    }).catchError((error, stacktrace) {
      state = AsyncValue.error(error, stackTrace: stacktrace);
    });
  }

  Future<void> initialize() async {
    state = const AsyncValue.loading();
    final error = ref.read(errorProvider.notifier);
    googleSignIn = GoogleSignIn(
      clientId:
          FirebaseRemoteConfig.instance.getString(RemoteConfigs.googleClientId),
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
            await logout();
          } else {
            await _authenticateUser(LoginProviders.google, gKey.idToken!);
          }
        } catch (e, stacktrace) {
          await FirebaseCrashlytics.instance.recordError(e, stacktrace);
          error.updateError(ErrorMessages.somethingWentWrong);
        }
      }
    });
    try {
      final result = await loadFromStorage();
      if (!result) {
        await googleSignIn?.signInSilently();
      }
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, stacktrace);
      error.updateError(ErrorMessages.somethingWentWrong);
      state = AsyncValue.error(e, stackTrace: stacktrace);
    }
  }

  Future<void> loginWithFacebook() async {
    state = const AsyncValue.loading();
    final error = ref.read(errorProvider.notifier);
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        await _authenticateUser(
            LoginProviders.facebook, result.accessToken!.token);
      } else {
        state = AsyncValue.error(Exception(result.message));
        error.updateError(
          result.message ?? ErrorMessages.somethingWentWrong,
        );
      }
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, null);
      error.updateError(ErrorMessages.somethingWentWrong);
      state = AsyncValue.error(e, stackTrace: stacktrace);
    }
  }

  Future<void> loginWithGoogle() async {
    state = const AsyncValue.loading();
    final error = ref.read(errorProvider.notifier);
    try {
      if (await googleSignIn?.signIn() == null) {
        state = const AsyncValue.error(ErrorMessages.googleLoginCancelled);
      }
    } catch (e, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(e, stacktrace);
      error.updateError(ErrorMessages.somethingWentWrong);
      state = AsyncValue.error(e, stackTrace: stacktrace);
    }
  }

  Future<void> logout() async {
    final client = ref.read(authNetworkClientProvider);
    final error = ref.read(errorProvider.notifier);
    final storage = ref.read(secureStorageProvider);
    String? refreshToken;
    String? storedAuth = await storage.read(key: StorageKeys.auth);
    if (storedAuth == null) {
      await _logoutCallbacks();
      return;
    }
    refreshToken =
        AuthInformation.fromJson(jsonDecode(storedAuth)).refreshToken;

    await error.safelyExecute(
        command: client
            .post(BackendRoutes.logout, data: {'refresh_token': refreshToken}),
        onSuccess: (_) async {
          await _logoutCallbacks();
        });
  }

  Future<String> getAccessToken() async {
    if (state.value!.shouldRefresh() == true) {
      await _refreshToken();
    }
    if (state.value == null) {
      await logout();
      return '';
    }
    return state.value!.accessToken;
  }

  Future<void> _refreshToken() async {
    final storage = ref.read(secureStorageProvider);
    final client = ref.read(authNetworkClientProvider);
    final error = ref.read(errorProvider.notifier);
    final refreshToken = state.value!.refreshToken;

    state = const AsyncValue.loading();
    await error.safelyExecute(
        command: client.post(BackendRoutes.refreshToken,
            data: {'refresh_token': refreshToken}),
        onSuccess: (response) async {
          state = AsyncValue.data(AuthInformation(
            response.data['data']['access_token'],
            refreshToken,
            response.data['data']['expires_in'] as int,
            DateTime.now(),
          ));
          await storage.write(
              key: StorageKeys.auth, value: jsonEncode(state.value));
        },
        onError: (error) => AsyncValue.error(error));
  }

  Future<void> _authenticateUser(
      String loginMethod, String providerToken) async {
    final client = ref.read(authNetworkClientProvider);
    final error = ref.read(errorProvider.notifier);
    final storage = ref.read(secureStorageProvider);
    final router = ref.read(routerProvider);
    await error.safelyExecute(
        command: client.post(BackendRoutes.authorize, data: {
          'auth_method': loginMethod,
          'platform': Platform.isAndroid
              ? PlatformConstants.android
              : PlatformConstants.ios,
          'token': providerToken,
        }),
        onSuccess: (response) async {
          state = AsyncValue.data(AuthInformation(
            response.data['data']['access_token'],
            response.data['data']['refresh_token'],
            response.data['data']['expires_in'] as int,
            DateTime.now(),
          ));
          await Future.wait([
            storage.write(
                key: StorageKeys.auth, value: jsonEncode(state.value)),
            _analyticsEvent(
                response.data['data']['is_new_user'] as bool, loginMethod)
          ]);
          await postLoginCallbacks();
          await router.replaceNamed(await postLoginRoute(ref));
        },
        onError: (error) => state = AsyncValue.error(error));
  }

  Future<void> postLoginCallbacks() async {
    await Future.wait([
      ref.read(locationProvider).syncLocationIfRequired(),
      ref.read(notificationsProvider).setupNotifications(ref)
    ]);
  }

  Future<void> _analyticsEvent(bool isNewLogin, String loginMethod) {
    if (isNewLogin) {
      return FirebaseAnalytics.instance.logSignUp(signUpMethod: loginMethod);
    }

    return FirebaseAnalytics.instance.logLogin(loginMethod: loginMethod);
  }

  Future<bool> loadFromStorage() async {
    final _storage = ref.read(secureStorageProvider);
    String? value = await _storage.read(key: StorageKeys.auth);
    if (value == null) {
      return false;
    }
    state = AsyncValue.data(AuthInformation.fromJson(jsonDecode(value)));
    final router = ref.read(routerProvider);
    await postLoginCallbacks();
    await router.replaceNamed(await postLoginRoute(ref));
    return true;
  }

  Future<void> _logoutCallbacks() async {
    final router = ref.read(routerProvider);
    final storage = ref.read(secureStorageProvider);
    if (await FacebookAuth.instance.accessToken != null) {
      await FacebookAuth.instance.logOut();
    }
    if (googleSignIn?.currentUser != null) {
      await googleSignIn!.signOut();
    }
    if (await storage.containsKey(key: StorageKeys.auth)) {
      await storage.delete(key: StorageKeys.auth);
    }
    state = AsyncValue.data(AuthInformation('', '', 100, DateTime.now()));
    await router.replaceAll([const LoginScreenRoute()]);
  }
}
