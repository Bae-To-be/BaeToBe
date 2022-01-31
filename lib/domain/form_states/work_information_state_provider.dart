import 'dart:ui';

import 'package:baetobe/domain/background_fields/industries_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkFormState {
  int? industryId;
  String? workTitleName;
  String? companyName;

  WorkFormState({this.industryId, this.companyName, this.workTitleName});

  @override
  bool operator ==(other) {
    return other is WorkFormState &&
        (other.industryId == industryId) &&
        (other.workTitleName == workTitleName) &&
        (other.companyName == companyName);
  }

  @override
  int get hashCode => hashValues(
      industryId.hashCode, workTitleName.hashCode, companyName.hashCode);

  @override
  String toString() {
    return {
      'industryId': industryId,
      'workTitleName': workTitleName,
      'companyName': companyName
    }.toString();
  }

  WorkFormState copyWith(
      {int? newIndustryId, String? newWorkTitleName, String? newCompanyName}) {
    return WorkFormState(
        workTitleName: newWorkTitleName ?? workTitleName,
        companyName: newCompanyName ?? companyName,
        industryId: newIndustryId ?? industryId);
  }

  bool allFilled() {
    return industryId != null &&
        companyName?.isNotEmpty == true &&
        workTitleName?.isNotEmpty == true;
  }
}

final workInformationStateProvider =
    StateProvider.autoDispose<WorkFormState>((ref) {
  final result = WorkFormState();
  final user = ref.watch(userProvider);
  final industries = ref.watch(industriesProvider);
  industries.whenData((industriesList) {
    if (user.industry != null) {
      final match = industriesList
          .firstWhereOrNull((industry) => industry.name == user.industry);
      if (match != null) {
        result.industryId = match.id;
      }
    }
    if (user.company != null) {
      result.companyName = user.company;
    }
    if (user.workTitle != null) {
      result.workTitleName = user.workTitle;
    }
  });
  return result;
});
