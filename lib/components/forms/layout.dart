import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class FormLayout extends StatelessWidget {
  final Widget floatingSubmit;
  final Widget? leftFloating;
  final Widget? stepIndicator;
  final List<Widget> children;
  final bool? registration;
  final Widget? header;

  const FormLayout(
      {Key? key,
      this.header,
      required this.children,
      required this.floatingSubmit,
      this.stepIndicator,
      this.leftFloating,
      this.registration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      stepIndicator ?? Container(),
      header ?? Container(),
      Column(children: <Widget>[
        ...children,
      ]).padding(horizontal: 16, top: header != null ? 70 : 0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          (leftFloating ?? Container()),
          floatingSubmit,
        ],
      ).padding(left: 24, right: 24, bottom: 24)
    ]);
  }
}
