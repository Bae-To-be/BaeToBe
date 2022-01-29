import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

ShapeBorder bottomSheetShape() {
  return const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(20),
    ),
  );
}

class BottomSheetHeader extends StatelessWidget {
  final String text;

  const BottomSheetHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 68,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )),
        child: Text(text, style: Theme.of(context).textTheme.headline5)
            .alignment(Alignment.centerLeft)
            .padding(left: 24));
  }
}
