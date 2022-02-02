import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;

  const CustomDivider({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: color ?? Theme.of(context).primaryColorLight,
      thickness: 1,
    );
  }
}
