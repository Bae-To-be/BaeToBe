import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/components/buttons/custom_text_button.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/forms/big_text_field.dart';
import 'package:baetobe/components/forms/select_tile.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/form_states/report_user_state_provider.dart';
import 'package:baetobe/domain/profile_details_provider.dart';
import 'package:baetobe/domain/report_reasons_provider.dart';
import 'package:baetobe/entities/data/detailed_profile.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class ReportUserScreen extends HookConsumerWidget {
  final DetailedProfile profile;
  const ReportUserScreen({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reasonsRequest = ref.watch(reportReasonsProvider);
    final state = ref.watch(reportUserStateProvider(profile.id));
    final isReported = ref.watch(isReportedProvider(profile.id));

    if (isReported) {
      return Column(
        children: [
          const CustomHeaderTile(text: LinkTexts.reportUser),
          SizedBox(height: MediaQuery.of(context).size.width / 10),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: GFCard(
              boxFit: BoxFit.cover,
              showImage: true,
              image: Image.asset(
                'assets/salute.gif',
              ),
              content: const CustomTextWidget(
                  withRow: false,
                  type: textWidgetType.subtitle2,
                  text: InfoLabels.reportUserSuccess),
              buttonBar: GFButtonBar(
                children: <Widget>[
                  GFButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      ref.read(routerProvider.notifier).pop();
                    },
                    text: LinkTexts.takeMeBack,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return ListView(children: [
      CustomHeaderTile(color: Colors.red[300], text: 'Report ${profile.name}'),
      reasonsRequest.maybeWhen(
          orElse: () => Center(
              child: CircularProgressIndicator(color: Colors.red[300])
                  .padding(top: 10)),
          data: (reasons) {
            return Column(
              children: [
                ...reasons.map((reason) => SelectTile(
                    selectedColor: Colors.red[100],
                    title: reason.name,
                    selected: reason.id == state.selected,
                    onTap: () {
                      ref
                          .read(reportUserStateProvider(profile.id).notifier)
                          .updateSelected(reason.id);
                    }).padding(horizontal: 15)),
                BigFomField(
                    value: state.comment ?? '',
                    onChanged: (text) {
                      ref
                          .read(reportUserStateProvider(profile.id).notifier)
                          .updateComment(text);
                    }).padding(horizontal: 20, vertical: 10),
                state.selected != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextButton(
                              type: textWidgetType.heading6,
                              color: Colors.red[300],
                              text: LinkTexts.submit,
                              onPressed: ref
                                  .read(reportUserStateProvider(profile.id)
                                      .notifier)
                                  .submitSelection),
                        ],
                      )
                    : Container(),
              ],
            );
          })
    ]);
  }
}
