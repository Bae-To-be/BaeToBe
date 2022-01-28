import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = ChangeNotifierProvider<AppRouter>((ref) {
  return AppRouter();
});
