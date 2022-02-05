import 'package:baetobe/domain/background_fields/industries_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/view_models/work_form_state.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final workInformationStateProvider =
    StateProvider.autoDispose<WorkFormState>((ref) {
  var result = WorkFormState();
  final user = ref.watch(userProvider);
  final industries = ref.watch(industriesProvider);
  industries.whenData((industriesList) {
    if (user.industry != null) {
      final match = industriesList
          .firstWhereOrNull((industry) => industry.name == user.industry);
      if (match != null) {
        result = result.copyWith(industryId: match.id);
      }
    }
  });
  if (user.company != null) {
    result = result.copyWith(companyName: user.company);
  }
  if (user.workTitle != null) {
    result = result.copyWith(workTitleName: user.workTitle);
  }
  return result;
});
