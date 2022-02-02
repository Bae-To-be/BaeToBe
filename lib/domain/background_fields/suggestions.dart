import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';

enum SuggestionEntity { university, company, workTitle, course, city }

final _routeMap = {
  SuggestionEntity.university: BackendRoutes.searchUniversities,
  SuggestionEntity.company: BackendRoutes.searchCompanies,
  SuggestionEntity.workTitle: BackendRoutes.searchWorkTitles,
  SuggestionEntity.course: BackendRoutes.searchCourses,
  SuggestionEntity.city: BackendRoutes.searchCities
};

Future<List<String>> suggestionsFor(
    SuggestionEntity entity, String query, ref) async {
  List<String> result = [];
  final error = ref.read(errorProvider.notifier);
  final client = ref.read(networkClientProvider);
  await error.safelyExecute(
      command: client.get(_routeMap[entity], queryParameters: {'query': query}),
      onSuccess: (response) {
        final suggestions =
            List<Map<String, dynamic>>.from(response.data['data']);
        result =
            suggestions.map((records) => records['name'] as String).toList();
        return Future.value(null);
      });
  return result;
}
