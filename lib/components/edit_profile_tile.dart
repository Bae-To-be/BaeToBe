import 'package:baetobe/components/custom_divider.dart';
import 'package:baetobe/components/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:styled_widget/styled_widget.dart';

class EditProfileContentTile extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback? callback;
  final bool? button;
  final bool? isVisible;

  const EditProfileContentTile(
      {Key? key,
      required this.title,
      required this.content,
      this.callback,
      required this.button,
      this.isVisible})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider().padding(horizontal: 4),
        button == true
            ? TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: callback,
                child: _EditProfileContentTile(
                  title: title,
                  content: content,
                  editable: button,
                ),
              )
            : _EditProfileContentTile(
                title: title,
                content: content,
                editable: button,
              ).padding(horizontal: 8, vertical: 8),
      ],
    );
  }
}

class _EditProfileContentTile extends StatelessWidget {
  final String title;
  final Widget content;
  final bool? editable;

  const _EditProfileContentTile({
    Key? key,
    required this.title,
    required this.content,
    this.editable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
                type: TextWidgetType.editProfileContentTileTitle, text: title),
            content.padding(top: 4),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            editable == true
                ? Icon(
                    FontAwesomeIcons.chevronRight,
                    color: Theme.of(context).primaryColor,
                  )
                : Container()
          ],
        )
      ],
    );
  }
}
