import 'package:baetobe/application/theme.dart';
import 'package:flutter/material.dart';

class CustomChipWidget extends StatelessWidget {
  final String label;
  final Widget avatar;

  const CustomChipWidget(this.label, {Key? key, required this.avatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Chip(
        label: Text(label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        avatar: avatar,
        backgroundColor: chipColor,
      ),
    );
  }
}
