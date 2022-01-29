import 'package:baetobe/components/forms/function_helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:styled_widget/styled_widget.dart';

class FloatingCta extends StatelessWidget {
  final String heroTag;
  final Widget body;
  final Color? color;
  final bool loading;
  final void Function() onPressed;

  final Alignment alignment;

  const FloatingCta(
      {Key? key,
      this.heroTag = 'submit',
      this.body =
          const Icon(FontAwesomeIcons.chevronRight, color: Colors.white),
      this.onPressed = doNothing,
      this.loading = false,
      this.color,
      this.alignment = Alignment.bottomRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return CircularProgressIndicator(color: Theme.of(context).primaryColor)
          .alignment(Alignment.bottomRight);
    }

    return FloatingActionButton(
            heroTag: 'submit',
            backgroundColor: color ?? Theme.of(context).primaryColor,
            onPressed: onPressed,
            child: body)
        .alignment(Alignment.bottomRight);
  }
}
