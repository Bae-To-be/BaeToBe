import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustomCheckbox extends StatelessWidget {
  final bool selected;
  final String? subtitleText;
  final void Function(bool value) onChanged;

  const CustomCheckbox(
      {Key? key,
      required this.selected,
      required this.onChanged,
      this.subtitleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFCheckboxListTile(
        subTitleText: subtitleText,
        color: selected
            ? Theme.of(context).primaryColorLight
            : const Color(0xFFF2F2F2),
        activeBgColor: Theme.of(context).primaryColor,
        inactiveBgColor: const Color(0xFFF2F2F2),
        onChanged: onChanged,
        value: selected,
        size: 18,
        margin: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        activeIcon: const Icon(
          Icons.check,
          size: 15,
          color: GFColors.WHITE,
        ),
        position: GFPosition.start);
  }
}
