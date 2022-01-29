import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class RoundedCta extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function() onPressed;
  final Color color;

  const RoundedCta(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color,
      this.icon})
      : super(key: key);

  List<Widget> buttonBody() {
    List<Widget> body = [
      Align(
        alignment: Alignment.center,
        child: Text(text),
      )
    ];

    if (icon != null) {
      body.add(Align(
          alignment: Alignment.centerLeft,
          child: Icon(icon!, color: Colors.white)));
    }

    return body;
  }

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: onPressed,
      color: color,
      shape: GFButtonShape.pills,
      size: GFSize.LARGE,
      blockButton: true,
      child: Stack(
        children: buttonBody(),
      ),
    );
  }
}
