import 'dart:async';

import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _RetryRequest {
  final Completer<Response> completer;
  final RequestOptions options;

  _RetryRequest(this.completer, this.options);
}

final connectivityProvider =
    StateNotifierProvider<ConnectivityNotifier, ConnectivityResult>((ref) {
  return ConnectivityNotifier(ref);
});

class ConnectivityNotifier extends StateNotifier<ConnectivityResult> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _subscription;
  final Ref ref;
  final Map<Dio, List<_RetryRequest>> _pendingRetries = {};

  ConnectivityNotifier(this.ref) : super(ConnectivityResult.none) {
    _setInitialState();
    _subscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _handleConnection(result);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<Response> scheduleRetry(Dio dioInstance, RequestOptions options) {
    final retryRequest = _RetryRequest(Completer<Response>(), options);
    if (_pendingRetries[dioInstance] == null) {
      _pendingRetries[dioInstance] = [retryRequest];
    } else {
      _pendingRetries[dioInstance]!.add(retryRequest);
    }
    return retryRequest.completer.future;
  }

  Future<void> _setInitialState() async {
    state = await _connectivity.checkConnectivity();
  }

  void _handleConnection(ConnectivityResult result) {
    state = result;
    if (result == ConnectivityResult.none) {
      ref
          .read(errorProvider.notifier)
          .updateError(ErrorMessages.noInternetConnection);
      return;
    }

    _pendingRetries.forEach((dioInstance, requests) {
      for (var request in requests) {
        request.completer.complete(_retryRequest(dioInstance, request.options));
        requests.remove(request);
      }
    });
  }
}

Future<Response> _retryRequest(Dio instance, RequestOptions requestOptions) {
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
