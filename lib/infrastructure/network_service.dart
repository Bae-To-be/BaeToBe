import 'dart:developer';
import 'dart:io';

import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/entities/like.dart';
import 'package:baetobe/entities/preferences_enum.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void _configureDioClient(Dio instance, RemoteConfig config) {
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
}

final networkClientProvider = Provider<Dio>((_) {
  final Dio _dio = Dio();
  _configureDioClient(_dio, RemoteConfig.instance);
  return _dio;
});

final authNetworkClientProvider = Provider<Dio>((_) {
  final Dio _dio = Dio();
  _configureDioClient(_dio, RemoteConfig.instance);
  return _dio;
});

const preferenceRouteMap = {
  PreferenceFor.children: BackendRoutes.listChildrenPreferences,
  PreferenceFor.drinking: BackendRoutes.listDrinkingPreferences,
  PreferenceFor.food: BackendRoutes.listFoodPreferences,
  PreferenceFor.smoking: BackendRoutes.listSmokingPreferences
};

const likeRouteMap = {
  likeDirection.received: BackendRoutes.listLikesReceived,
  likeDirection.sent: BackendRoutes.listLikesSent
};

class NetworkService {
  final Dio _dio;
  final Dio _authDio;

  NetworkService(this._dio, this._authDio);

  static Future<Response> retryRequest(
      Dio instance, RequestOptions requestOptions) {
    return instance.request(requestOptions.path,
        cancelToken: requestOptions.cancelToken,
        data: requestOptions.data,
        onReceiveProgress: requestOptions.onReceiveProgress,
        onSendProgress: requestOptions.onSendProgress,
        queryParameters: requestOptions.queryParameters,
        options: Options(
          method: requestOptions.method,
          sendTimeout: requestOptions.sendTimeout,
          receiveTimeout: requestOptions.receiveTimeout,
          extra: requestOptions.extra,
          headers: requestOptions.headers,
          responseType: requestOptions.responseType,
          contentType: requestOptions.contentType,
          validateStatus: requestOptions.validateStatus,
          receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
          followRedirects: requestOptions.followRedirects,
          maxRedirects: requestOptions.maxRedirects,
          requestEncoder: requestOptions.requestEncoder,
          responseDecoder: requestOptions.responseDecoder,
          listFormat: requestOptions.listFormat,
        ));
  }

  Future<Response> loginUser(
      String loginMethod, String providerToken, String platform) {
    log(providerToken);
    return _authDio.post(BackendRoutes.authorize, data: {
      'auth_method': loginMethod,
      'platform': platform,
      'token': providerToken,
    });
  }

  Future<Response> deleteAccount() {
    return _dio.delete(BackendRoutes.deleteAccount);
  }

  Future<Response> logoutUser(String refreshToken) {
    return _authDio
        .post(BackendRoutes.logout, data: {'refresh_token': refreshToken});
  }

  Future<Response> refreshToken(String refreshToken) {
    return _authDio.post(BackendRoutes.refreshToken,
        data: {'refresh_token': refreshToken});
  }

  Future<Response> searchWorkTitles(String query) {
    return _dio
        .get(BackendRoutes.searchWorkTitles, queryParameters: {'query': query});
  }

  Future<Response> searchCities(String query) {
    return _dio
        .get(BackendRoutes.searchCities, queryParameters: {'query': query});
  }

  Future<Response> potentialMatches() {
    return _dio.get(BackendRoutes.potentialMatches);
  }

  Future<Response> swipe(int userId, String direction) {
    return _dio.post(BackendRoutes.swipe,
        data: {'user_id': userId, 'direction': direction});
  }

  Future<Response> searchCompanies(String query) {
    return _dio
        .get(BackendRoutes.searchCompanies, queryParameters: {'query': query});
  }

  Future<Response> searchCourses(String query) {
    return _dio
        .get(BackendRoutes.searchCourses, queryParameters: {'query': query});
  }

  Future<Response> searchUniversities(String query) {
    return _dio.get(BackendRoutes.searchUniversities,
        queryParameters: {'query': query});
  }

  Future<Response> userDetails() {
    return _dio.get(BackendRoutes.userDetails);
  }

  Future<Response> verificationInfo() {
    return _dio.get(BackendRoutes.verificationInfo);
  }

  Future<Response> listGenders() {
    return _dio.get(BackendRoutes.listGenders);
  }

  Future<Response> listPreferences(PreferenceFor preferenceFor) {
    return _dio.get(preferenceRouteMap[preferenceFor]!);
  }

  Future<Response> getLikes(likeDirection direction, int pageNumber) {
    return _dio
        .get(likeRouteMap[direction]!, queryParameters: {'page': pageNumber});
  }

  Future<Response> listReportReasons() {
    return _dio.get(BackendRoutes.listReportReasons);
  }

  Future<Response> reportUser(int userId, int reasonId, String comment) {
    return _dio.post(BackendRoutes.reportUser,
        data: {'user_id': userId, 'reason_id': reasonId, 'comment': comment});
  }

  Future<Response> getMatches(int pageNumber) {
    return _dio
        .get(BackendRoutes.listMatches, queryParameters: {'page': pageNumber});
  }

  Future<Response> getMessages(int matchId, int pageNumber) {
    return _dio.get(
        BackendRoutes.listMessages
            .replaceAll('%{match_id}', matchId.toString()),
        queryParameters: {'page': pageNumber});
  }

  Future<Response> closeMatch(int matchId) {
    return _dio.post(
        BackendRoutes.closeMatch.replaceAll('%{match_id}', matchId.toString()));
  }

  Future<Response> listLanguages() {
    return _dio.get(BackendRoutes.listLanguages);
  }

  Future<Response> listReligions() {
    return _dio.get(BackendRoutes.listReligions);
  }

  Future<Response> listIndustries() {
    return _dio.get(BackendRoutes.listIndustries);
  }

  Future<Response> listCountries() {
    return _dio.get(BackendRoutes.listCountries);
  }

  Future<Response> updateUser(Map<String, dynamic> attributes) {
    return _dio.patch(BackendRoutes.updateUser, data: attributes);
  }

  Future<Response> uploadImage(
      int index, String filePath, String filename) async {
    return _dio.post(BackendRoutes.uploadImage,
        data: FormData.fromMap({
          'position': index,
          'image': await MultipartFile.fromFile(
            filePath,
            filename: filename,
          )
        }));
  }

  Future<Response> uploadVerificationFile(
      String fileType, String filePath, String? filename) async {
    return _dio.post(BackendRoutes.uploadVerificationFile,
        data: FormData.fromMap({
          'file_type': fileType,
          'file': await MultipartFile.fromFile(
            filePath,
            filename: filename,
          )
        }));
  }

  Future<Response> deleteImage(int position) {
    return _dio.delete(BackendRoutes.deleteImage
        .replaceAll('%{position}', position.toString()));
  }

  Future<Response> userProfile(int id) {
    return _dio
        .get(BackendRoutes.userProfile.replaceAll('%{id}', id.toString()));
  }

  Future<Response> deleteVerificationFile(String verificationType) {
    return _dio.delete(BackendRoutes.deleteVerificationFile
        .replaceAll('%{file_type}', verificationType));
  }

  Future<Response> listImages() {
    return _dio.get(BackendRoutes.listImages);
  }

  Future<Response> listVerificationFiles() {
    return _dio.get(BackendRoutes.listVerificationFiles);
  }

  Future<Response> getHelpArticles() {
    return _dio.get(BackendRoutes.articles);
  }
}
