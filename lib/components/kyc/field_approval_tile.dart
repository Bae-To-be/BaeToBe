import 'package:auto_route/auto_route.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';

class FieldApprovalTile extends StatelessWidget {
  final List<String> fieldsUpdated;
  final String fieldName;
  final String titleText;
  final bool value;
  final String link;

  const FieldApprovalTile(
      {Key? key,
      required this.fieldsUpdated,
      required this.fieldName,
      required this.titleText,
      required this.value,
      required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isFieldUpdated = fieldsUpdated.contains(fieldName);

    return GFCheckboxListTile(
      titleText: titleText,
      size: 25,
      padding: const EdgeInsets.all(5),
      type: GFCheckboxType.circle,
      subTitleText: (value || isFieldUpdated)
          ? (value ? InfoLabels.allGood : InfoLabels.correctionSubmitted)
          : InfoLabels.pleaseChangeField,
      inactiveBgColor: const Color(0xFFF2F2F2),
      inactiveBorderColor: const Color(0xFFF2F2F2),
      activeBgColor: const Color(0xFFF2F2F2),
      activeBorderColor: const Color(0xFFF2F2F2),
      inactiveIcon: Icon(FontAwesomeIcons.chevronRight,
          color: isFieldUpdated
              ? const Color(0xFFF2F2F2)
              : Theme.of(context).errorColor),
      onChanged: (_) {
        if (!value && !isFieldUpdated) {
          AutoRouter.of(context).pushNamed('$link?redirectBack=true');
        }
      },
      value: value,
    );
  }
}
