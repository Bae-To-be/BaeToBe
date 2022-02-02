import 'package:baetobe/application/routing/auth_guard.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/infrastructure/alice_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = ChangeNotifierProvider<AppRouter>((ref) {
  return AppRouter(
      navigatorKey: ref.read(aliceProvider).getNavigatorKey(),
      authGuard: AuthGuard(ref));
});
