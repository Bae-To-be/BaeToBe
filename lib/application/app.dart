import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/boot_callback.dart';
import 'package:baetobe/application/page_wrapper.dart';
import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/theme.dart';
import 'package:baetobe/domain/auth_provider.dart';
import 'package:baetobe/entities/generated/auth_information.dart';
import 'package:baetobe/infrastructure/router_logger.dart';
import 'package:baetobe/screens/boot/something_went_wrong_screen.dart';
import 'package:baetobe/screens/boot/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> booted = ref.watch(bootCallback);
    return booted.when(
        loading: () => const SplashScreen(),
        error: (err, stack) => const CouldNotLoadApp(),
        data: (_) => const LoadedApp());
  }
}

class LoadedApp extends HookConsumerWidget {
  const LoadedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appRouter = ref.read(routerProvider);
    final AsyncValue<AuthInformation> auth = ref.watch(authProvider);
    return auth.maybeWhen(
        orElse: () => MaterialApp.router(
              theme: theme,
              routerDelegate: AutoRouterDelegate(
                _appRouter,
                navigatorObservers: () => [RouterLogger()],
              ),
              builder: (context, child) {
                if (child == null) {
                  return Container();
                }
                return PageWrapper(child: child);
              },
              routeInformationParser: _appRouter.defaultRouteParser(),
              debugShowCheckedModeBanner: false,
            ));
  }
}
