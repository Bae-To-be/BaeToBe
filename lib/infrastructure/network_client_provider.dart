import 'dart:io';

import 'package:baetobe/domain/auth_provider.dart';
import 'package:baetobe/infrastructure/connectivity_provider.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void _configureDioClient(Dio instance, FirebaseRemoteConfig config,
    ConnectivityNotifier connectivity) {
  (instance.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  instance.options.baseUrl = config.getString('API_HOST');
  instance.options.connectTimeout = config.getInt('CONNECT_TIMEOUT');
  instance.options.receiveTimeout = config.getInt('RECEIVE_TIMEOUT');
  if (kDebugMode) {
    instance.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }
  instance.interceptors.add(InterceptorsWrapper(
      onError: (DioError error, ErrorInterceptorHandler handler) async {
    if (error.type == DioErrorType.other && error.error is SocketException) {
      try {
        final response =
            await connectivity.scheduleRetry(instance, error.requestOptions);
        return handler.resolve(response);
      } on DioError catch (e) {
        return handler.next(e);
      } catch (e) {
        return handler.next(error);
      }
    }
    return handler.next(error);
  }));
}

final networkClientProvider = Provider<Dio>((ref) {
  final auth = ref.read(authProvider.notifier);
  final Dio dio = Dio();
  _configureDioClient(dio, FirebaseRemoteConfig.instance,
      ref.read(connectivityProvider.notifier));
  dio.interceptors.add(QueuedInterceptorsWrapper(onRequest:
      (RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = 'Bearer ' + await auth.getAccessToken();
    handler.next(options);
  }, onError: (DioError error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {
      try {
        await auth.logout();
        return handler.next(error);
      } catch (e) {
        return handler.next(error);
      }
    }
    return handler.next(error);
  }));
  return dio;
});

final authNetworkClientProvider = Provider<Dio>((ref) {
  final Dio _dio = Dio();
  _configureDioClient(_dio, FirebaseRemoteConfig.instance,
      ref.read(connectivityProvider.notifier));
  return _dio;
});
