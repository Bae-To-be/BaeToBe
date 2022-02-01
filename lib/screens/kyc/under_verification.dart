import 'package:baetobe/components/buttons/custom_text_button.dart';
import 'package:baetobe/components/custom_icons.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:baetobe/domain/verification_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class UnderVerification extends HookConsumerWidget {
  const UnderVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      SizedBox(height: MediaQuery.of(context).size.width * 0.3),
      Text.rich(
        TextSpan(style: Theme.of(context).textTheme.headline2, children: const [
          TextSpan(text: Headings.accountUnderVerification),
          WidgetSpan(
            child: Icon(BTBCustomIcons.btbheart,
                size: 12, color: Color(0xFFEC505C)),
          ),
        ]),
      ).padding(bottom: 20),
      const Heading6(
        text: InfoLabels.underVerificationHelper,
        withRow: false,
      ),
      Expanded(child: Container()),
      CustomTextButton(
              text: LinkTexts.refreshStatus,
              onPressed: ref.read(verificationInfoProvider.notifier).loadInfo)
          .padding(bottom: 10),
    ]).padding(horizontal: 16);
  }
}
