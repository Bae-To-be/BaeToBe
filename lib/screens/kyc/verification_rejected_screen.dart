import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/components/buttons/custom_text_button.dart';
import 'package:baetobe/components/kyc/field_approval_tile.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/app_constants.dart';
import 'package:baetobe/constants/app_links.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/verification_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class VerificationRejectedScreen extends HookConsumerWidget {
  const VerificationRejectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verificationInfo = ref.watch(verificationInfoProvider);

    if (verificationInfo == null) {
      return const Center(
          child: CustomTextWidget(
              type: textWidgetType.heading5,
              withRow: false,
              text: ErrorMessages.couldNotLoadVerificationInfo));
    }

    if (verificationInfo.status == ApprovalStatuses.inReview) {
      ref
          .read(routerProvider.notifier)
          .replaceNamed(AppLinks.underVerification);
    }

    // if (verificationInfo.status == ApprovalStatuses.approved) {
    //   ref.read(routerProvider.notifier).replaceNamed(AppLinks.homePage);
    // }

    return Column(children: [
      const SizedBox(height: 32),
      const CustomTextWidget(
              type: textWidgetType.heading5,
              text: Headings.verificationRejected,
              withRow: false)
          .padding(top: 32, bottom: 10, horizontal: 30),
      Expanded(
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          children: <Widget>[
            FieldApprovalTile(
                fieldName: ApprovalFields.linkedin,
                fieldsUpdated: verificationInfo.fieldsUpdated,
                link: AppLinks.updateLinkedInURL,
                value: verificationInfo.linkedinApproved == true,
                titleText: ApprovalFieldLabels.linkedinUrl),
            FieldApprovalTile(
                fieldName: ApprovalFields.workDetails,
                fieldsUpdated: verificationInfo.fieldsUpdated,
                link: AppLinks.updateWorkDetails,
                value: verificationInfo.workDetailsApproved == true,
                titleText: ApprovalFieldLabels.workDetails),
            FieldApprovalTile(
                fieldName: ApprovalFields.education,
                fieldsUpdated: verificationInfo.fieldsUpdated,
                link: AppLinks.updateEducationHistory,
                value: verificationInfo.educationApproved == true,
                titleText: ApprovalFieldLabels.education),
            FieldApprovalTile(
                fieldName: ApprovalFields.selfie,
                fieldsUpdated: verificationInfo.fieldsUpdated,
                link: AppLinks.selfieVerification,
                value: verificationInfo.selfieApproved == true,
                titleText: ApprovalFieldLabels.selfie),
            FieldApprovalTile(
                fieldName: ApprovalFields.identity,
                fieldsUpdated: verificationInfo.fieldsUpdated,
                link: AppLinks.identityVerification,
                value: verificationInfo.identityApproved == true,
                titleText: ApprovalFieldLabels.identity),
            FieldApprovalTile(
                fieldName: ApprovalFields.birthday,
                fieldsUpdated: verificationInfo.fieldsUpdated,
                link: AppLinks.updateBirthday,
                value: verificationInfo.dobApproved == true,
                titleText: ApprovalFieldLabels.birthday),
            verificationInfo.rejectionReason == null
                ? Container()
                : GFCard(
                    color: Colors.red[100],
                    boxFit: BoxFit.cover,
                    content: CustomTextWidget(
                        text: verificationInfo.rejectionReason!,
                        type: textWidgetType.caption,
                        withRow: false),
                  ),
          ],
        ),
      ),
      CustomTextButton(
          text: LinkTexts.help,
          onPressed: () => ref
              .read(routerProvider.notifier)
              .pushNamed(AppLinks.helpPage)).padding(bottom: 10)
    ]);
  }
}
