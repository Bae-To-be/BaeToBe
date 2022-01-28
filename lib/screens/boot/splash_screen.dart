import 'package:auto_route/auto_route.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/domain/auth_provider.dart';
import 'package:baetobe/entities/auth_information.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  final bool boot;

  const SplashScreen({Key? key, this.boot = false}) : super(key: key);

  Widget _splashBody() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Directionality(
              textDirection: TextDirection.ltr,
              child: LinearProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.white,
              )),
          Image(
            image: AssetImage('assets/splash_logo/splash.png'),
          ),
          Directionality(
              textDirection: TextDirection.ltr,
              child: LinearProgressIndicator(
                color: Color(0xFF00838C),
                backgroundColor: Color(0xFFCCECEE),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (boot) {
      return _splashBody();
    }
    AsyncValue<AuthInformation> auth = ref.watch(authProvider);
    return auth.when(
      loading: () => _splashBody(),
      error: (Object error, StackTrace? stackTrace) {
        AutoRouter.of(context).replaceNamed(AppLinks.login);
        return Container();
      },
      data: (authInfo) {
        if (authInfo.isLoggedIn()) {
          AutoRouter.of(context).replaceNamed(AppLinks.homePage);
        } else {
          AutoRouter.of(context).replaceNamed(AppLinks.login);
        }
        return Container();
      },
    );
  }
}
