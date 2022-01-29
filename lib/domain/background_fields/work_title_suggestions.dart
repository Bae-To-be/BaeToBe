import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';

Future<List<String>> workTitleSuggestions(ref, query) async {
  List<String> result = [];
  final error = ref.read(errorProvider.notifier);
  final client = ref.read(networkClientProvider);
  await error.safelyExecute(
      command: client.get(BackendRoutes.searchWorkTitles,
          queryParameters: {'query': query}),
      onSuccess: (response) {
        final suggestions =
            List<Map<String, dynamic>>.from(response.data['data']);
        result = suggestions
            .map((workTitle) => workTitle['name'] as String)
            .toList();
        return Future.value(null);
      });
  return result;
}
