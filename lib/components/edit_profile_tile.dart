import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:styled_widget/styled_widget.dart';

import 'custom_divider.dart';

class EditProfileSectionTile extends StatelessWidget {
  final String title;

  const EditProfileSectionTile({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 22, color: Colors.grey)),
      ],
    ).padding(top: 16, bottom: 12);
  }
}

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
        const CustomDivider(),
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
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            Expanded(child: Container()),
            editable == true
                ? Icon(
                    FontAwesomeIcons.chevronRight,
                    color: Theme.of(context).primaryColor,
                  )
                : const Icon(
                    FontAwesomeIcons.chevronRight,
                    color: Color(0xFFF2F2F2),
                  )
          ],
        ),
        Row(
          children: [
            Expanded(child: content),
          ],
        ).padding(top: 4),
      ],
    );
  }
}
