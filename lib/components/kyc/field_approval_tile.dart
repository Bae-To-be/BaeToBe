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

    bool? toggle = value || isFieldUpdated;
    return IgnorePointer(
      ignoring: toggle,
      child: TextButton(
        onPressed: () {
          if (!value && !isFieldUpdated) {
            AutoRouter.of(context).pushNamed('$link?redirectBack=true');
          }
        },
        child: GFListTile(
          margin: const EdgeInsets.symmetric(vertical: 0),
          titleText: titleText,
          padding: const EdgeInsets.all(5),
          subTitleText: (toggle)
              ? (value ? InfoLabels.allGood : InfoLabels.correctionSubmitted)
              : InfoLabels.pleaseChangeField,
          icon: toggle
              ? Container()
              : Icon(FontAwesomeIcons.chevronRight,
                  color: Theme.of(context).errorColor),
        ),
      ),
    );
  }
}
