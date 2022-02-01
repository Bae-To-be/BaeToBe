import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/entities/article.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final articleProvider = FutureProvider.autoDispose<List<Article>>((ref) async {
  final error = ref.read(errorProvider.notifier);
  final client = ref.read(networkClientProvider);
  List<Article> result = [];

  await error.safelyExecute(
      command: client.get(BackendRoutes.articles),
      onSuccess: (response) {
        for (var article in response.data['data']) {
          result.add(Article.fromJson(article));
        }
        return Future.value(null);
      });
  return result;
});
