import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/auto_complete_field.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/components/work_information/industry_field.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/company_suggestions_provider.dart';
import 'package:baetobe/domain/background_fields/industries_provider.dart';
import 'package:baetobe/domain/background_fields/work_title_suggestions.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

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

final workFormStateProvider = StateProvider.autoDispose<WorkFormState>((ref) {
  final result = WorkFormState();
  final user = ref.watch(userProvider);
  final industries = ref.watch(industriesProvider);
  user.whenData((userValue) {
    industries.whenData((industriesList) {
      if (userValue.industry != null) {
        final match = industriesList.firstWhereOrNull(
            (industry) => industry.name == userValue.industry);
        if (match != null) {
          result.industryId = match.id;
        }
      }
      if (userValue.company != null) {
        result.companyName = userValue.company;
      }
      if (userValue.workTitle != null) {
        result.workTitleName = userValue.workTitle;
      }
    });
  });
  return result;
});

class UpdateWorkInformationScreen extends HookConsumerWidget {
  const UpdateWorkInformationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final state = ref.watch(workFormStateProvider);
    final companyController = useTextEditingController
        .fromValue(TextEditingValue(text: state.companyName ?? ''));
    final workTitleController = useTextEditingController
        .fromValue(TextEditingValue(text: state.workTitleName ?? ''));
    workTitleController.addListener(() {
      ref.read(workFormStateProvider.notifier).state =
          state.copyWith(newWorkTitleName: workTitleController.text);
    });
    companyController.addListener(() {
      ref.read(workFormStateProvider.notifier).state =
          state.copyWith(newCompanyName: companyController.text);
    });
    return FormLayout(
        children: [
          const SizedBox(height: 32),
          const Heading5(text: Headings.enterIndustry)
              .padding(top: 32, bottom: 20, left: 15),
          const IndustryField().padding(horizontal: 10),
          const Heading5(text: Headings.enterWorkTitle)
              .padding(top: 32, left: 15),
          AutoCompleteField(
            textController: workTitleController,
            hintText: state.companyName == null ? Placeholders.workTitle : '',
            onSuggestionSelected: (String selection) {
              workTitleController.text = selection;
            },
            suggestionsCallback: (String pattern) {
              return workTitleSuggestions(ref, pattern);
            },
          ).padding(horizontal: 15, vertical: 10),
          const Heading5(text: Headings.enterCompany)
              .padding(top: 32, left: 15),
          AutoCompleteField(
            textController: companyController,
            hintText: state.companyName == null ? Placeholders.company : '',
            onSuggestionSelected: (String selection) {
              companyController.text = selection;
            },
            suggestionsCallback: (String pattern) {
              return companySuggestions(ref, pattern);
            },
          ).padding(horizontal: 15, vertical: 10),
        ],
        floatingSubmit: FloatingCta(
          color:
              state.allFilled() ? Theme.of(context).primaryColor : Colors.grey,
          loading: user is AsyncLoading,
          onPressed: () {
            if (!state.allFilled()) {
              return;
            }
            ref.read(userProvider.notifier).updateAttributes({
              'industry_id': state.industryId,
              'company_name': state.companyName,
              'work_title_name': state.workTitleName,
            }, routeTo: AppLinks.updateEducationHistory);
          },
        ));
  }
}
