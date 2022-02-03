import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/domain/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if ([AppLinks.login, AppLinks.splash].contains(resolver.route.path)) {
      return resolver.next(true);
    }
    final auth = ref.read(authProvider).value;
    if (auth == null) {
      // We are in the middle of refresh token
      return resolver.next(true);
    }

    if (auth.accessToken == '') {
      router.replaceAll([const LoginScreenRoute()]);
      return resolver.next(false);
    }
    return resolver.next(true);
  }
}
