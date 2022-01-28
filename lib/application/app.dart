import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/boot_callback.dart';
import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/domain/auth_provider.dart';
import 'package:baetobe/infrastructure/router_logger.dart';
import 'package:baetobe/screens/boot/something_went_wrong_screen.dart';
import 'package:baetobe/screens/boot/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<void> booted = ref.watch(bootCallback);
    return booted.when(
        loading: () => const SplashScreen(),
        error: (err, stack) => const CouldNotLoadApp(),
        data: (_) => const AppWithAuth());
  }
}

class AppWithAuth extends HookConsumerWidget {
  const AppWithAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<AuthNotifier> auth = ref.watch(authProvider);
    return auth.when(
      data: (_) => const LoadedApp(),
      error: (Object error, StackTrace? stackTrace) => const CouldNotLoadApp(),
      loading: () => const SplashScreen(),
    );
  }
}

class LoadedApp extends HookConsumerWidget {
  const LoadedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appRouter = ref.read(routerProvider);
    return MaterialApp.router(
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [RouterLogger()],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
