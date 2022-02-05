import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/forms/big_text_field.dart';
import 'package:baetobe/components/forms/select_tile.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/form_states/report_user_state_provider.dart';
import 'package:baetobe/domain/report_reasons_provider.dart';
import 'package:baetobe/entities/data/detailed_profile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class ReportUserScreen extends HookConsumerWidget {
  final DetailedProfile profile;
  const ReportUserScreen({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reasonsRequest = ref.watch(reportReasonsProvider);
    final state = ref.watch(reportUserStateProvider(profile.id));

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
                          TextButton(
                              onPressed: ref
                                  .read(reportUserStateProvider(profile.id)
                                      .notifier)
                                  .submitSelection,
                              child: Text(LinkTexts.submit,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: Colors.red[300]))),
                        ],
                      )
                    : Container(),
              ],
            );
          })
    ]);
  }
}
