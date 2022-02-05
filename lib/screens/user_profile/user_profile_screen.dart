import 'package:auto_route/auto_route.dart';
import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/components/buttons/custom_text_button.dart';
import 'package:baetobe/components/custom_header_tile.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/profile_details_provider.dart';
import 'package:baetobe/entities/data/detailed_profile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UserProfileScreen extends HookConsumerWidget {
  final int id;

  const UserProfileScreen({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  List<Widget> actions(
    BuildContext context,
    bool isMatchClosed,
    bool isReported,
    WidgetRef ref,
    DetailedProfile profile,
  ) {
    List<Widget> result = [];

    if (!isReported) {
      result.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextButton(
              onPressed: () => ref
                  .read(routerProvider.notifier)
                  .push(ReportUserScreenRoute(profile: profile)),
              text: LinkTexts.reportUser,
              type: textWidgetType.caption),
        ],
      ));
    }

    if (profile.match == null) {
      return result;
    }

    result.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextButton(
            onPressed: () {
              ref
                  .read(routerProvider.notifier)
                  .navigate(MessagesForMatchScreenRoute(match: profile.match!));
            },
            text: LinkTexts.conversation,
            type: textWidgetType.caption),
      ],
    ));

    if (!isMatchClosed) {
      result.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(InfoLabels.warning),
                          content: const Text(InfoLabels.closeMatchInfo),
                          actions: [
                            TextButton(
                              child: const Text(LinkTexts.cancel),
                              onPressed: () {
                                ref.read(routerProvider.notifier).pop();
                              },
                            ),
                            TextButton(
                              child: const Text(LinkTexts.cont),
                              onPressed: () =>
                                  closeMatch(profile.match!.id, ref),
                            ),
                          ],
                        ));
              },
              type: textWidgetType.caption,
              text: 'Unmatch'),
        ],
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRequest = ref.watch(profileDetailsProvider(id));
    final isReported = ref.watch(isReportedProvider(id));
    final isMatchClosed = ref.watch(isProfileMatchClosedProvider(id));

    return profileRequest.maybeWhen(
        orElse: () => Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor)),
        data: (profile) {
          if (profile == null) {
            return const Center(
                child: CustomTextWidget(
              type: textWidgetType.heading5,
              text: ErrorMessages.userNotFound,
              withRow: false,
            ));
          }

          return Column(
            children: [
              CustomHeaderTile(text: profile.name),
              Expanded(
                  child: SingleChildScrollView(
                      child: Text(profile.toString()).padding(horizontal: 15))),
              ...actions(context, isMatchClosed, isReported, ref, profile)
            ],
          );
        });
  }
}
