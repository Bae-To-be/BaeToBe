import 'package:baetobe/constants/backend_routes.dart';
import 'package:baetobe/domain/error_provider.dart';
import 'package:baetobe/infrastructure/network_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SuggestionEntity { university, company, workTitle, course, city }

final _routeMap = {
  SuggestionEntity.university: BackendRoutes.searchUniversities,
  SuggestionEntity.company: BackendRoutes.searchCompanies,
  SuggestionEntity.workTitle: BackendRoutes.searchWorkTitles,
  SuggestionEntity.course: BackendRoutes.searchCourses,
  SuggestionEntity.city: BackendRoutes.searchCities
};

final suggestorProvider =
    Provider.autoDispose.family<Suggestor, SuggestionEntity>((ref, entity) {
  return Suggestor(ref, entity);
});

class Suggestor {
  CancelToken? token;

  final SuggestionEntity entity;
  final Ref ref;

  Suggestor(this.ref, this.entity);

  Future<List<String>> suggestionsFor(String query) async {
    token?.cancel();
    token = CancelToken();
    List<String> result = [];
    final error = ref.read(errorProvider.notifier);
    final Dio client = ref.read(networkClientProvider);
    await error.safelyExecute(
        command: client.get(_routeMap[entity]!,
            queryParameters: {'query': query}, cancelToken: token),
        onSuccess: (response) {
          final suggestions =
              List<Map<String, dynamic>>.from(response.data['data']);
          result =
              suggestions.map((records) => records['name'] as String).toList();
          return Future.value(null);
        });
    return result;
  }
}
