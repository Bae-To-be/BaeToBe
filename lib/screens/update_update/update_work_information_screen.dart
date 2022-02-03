import 'package:auto_route/auto_route.dart';
import 'package:baetobe/components/buttons/floating_cta.dart';
import 'package:baetobe/components/forms/auto_complete_field.dart';
import 'package:baetobe/components/forms/layout.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/components/work_information/industry_field.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/background_fields/suggestions.dart';
import 'package:baetobe/domain/form_states/work_information_state_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UpdateWorkInformationScreen extends HookConsumerWidget {
  final bool? redirectBack;

  const UpdateWorkInformationScreen(
      {Key? key, @QueryParam('redirectBack') this.redirectBack})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(workInformationStateProvider);
    final companyController = useTextEditingController
        .fromValue(TextEditingValue(text: state.companyName ?? ''));
    final workTitleController = useTextEditingController
        .fromValue(TextEditingValue(text: state.workTitleName ?? ''));
    workTitleController.addListener(() {
      if (ref.read(workInformationStateProvider.notifier).state.workTitleName !=
          workTitleController.text) {
        ref.read(workInformationStateProvider.notifier).state = ref
            .read(workInformationStateProvider.notifier)
            .state
            .copyWith(newWorkTitleName: workTitleController.text);
      }
    });
    companyController.addListener(() {
      if (ref.read(workInformationStateProvider.notifier).state.companyName !=
          companyController.text) {
        ref.read(workInformationStateProvider.notifier).state = ref
            .read(workInformationStateProvider.notifier)
            .state
            .copyWith(newCompanyName: companyController.text);
      }
    });
    useEffect(() {
      if (state.companyName != null &&
          companyController.text != state.companyName) {
        companyController.text = state.companyName!;
      }
      if (state.workTitleName != null &&
          workTitleController.text != state.workTitleName) {
        workTitleController.text = state.workTitleName!;
      }
      return null;
    }, [state]);
    return FormLayout(
        children: [
          Expanded(
              child: ListView(
            children: [
              const SizedBox(height: 32),
              const Heading5(text: Headings.enterIndustry, withRow: false)
                  .padding(top: 32, bottom: 20, left: 15),
              const IndustryField().padding(horizontal: 10),
              const Heading5(text: Headings.enterWorkTitle, withRow: false)
                  .padding(top: 32, left: 15),
              AutoCompleteField(
                textController: workTitleController,
                hintText:
                    state.companyName == null ? Placeholders.workTitle : '',
                onSuggestionSelected: (String selection) {
                  workTitleController.text = selection;
                },
                suggestionsCallback: (String pattern) {
                  return suggestionsFor(
                      SuggestionEntity.workTitle, pattern, ref);
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
                  return suggestionsFor(SuggestionEntity.company, pattern, ref);
                },
              ).padding(horizontal: 15, vertical: 10),
            ],
          ))
        ],
        floatingSubmit: FloatingCta(
          enabled: state.allFilled(),
          onPressed: () {
            ref.read(userProvider.notifier).updateAttributes({
              'industry_id': state.industryId,
              'company_name': state.companyName,
              'work_title_name': state.workTitleName,
            },
                routeTo: redirectBack == true
                    ? AppLinks.back
                    : AppLinks.updateEducationHistory);
          },
        ));
  }
}
