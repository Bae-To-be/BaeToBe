import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      debugPrint({
        'event': 'provider added',
        'provider': provider.name ?? provider.runtimeType,
      }.toString());
    }
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      debugPrint({
        'event': 'provider failed',
        'error': error.toString(),
        'stacktrace': stackTrace,
        'provider': provider.name ?? provider.runtimeType,
      }.toString());
    }
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer containers,
  ) {
    if (kDebugMode) {
      debugPrint({
        'event': 'provider disposed',
        'provider': provider.name ?? provider.runtimeType,
      }.toString());
    }
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      debugPrint({
        'event': 'provider updated',
        'provider': provider.name ?? provider.runtimeType,
        'newValue': newValue.toString()
      }.toString());
    }
  }
}
