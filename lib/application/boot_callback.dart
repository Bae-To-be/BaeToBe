import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bootCallback = FutureProvider<void>((ref) async {
  await Firebase.initializeApp();
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  // Enable for debugging
  // await remoteConfig.setConfigSettings(RemoteConfigSettings(
  //   fetchTimeout: const Duration(seconds: 10),
  //   minimumFetchInterval: const Duration(seconds: 1),
  // ));
  await remoteConfig.fetchAndActivate();

  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
});
