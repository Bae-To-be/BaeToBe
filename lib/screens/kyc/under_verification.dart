import 'package:baetobe/components/custom_icons.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class UnderVerification extends StatelessWidget {
  const UnderVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: MediaQuery.of(context).size.width * 0.2),
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
      )
    ]).padding(horizontal: 16, top: 36);
  }
}
