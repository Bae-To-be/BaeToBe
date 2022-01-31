import 'package:baetobe/components/forms/function_helpers.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class FloatingCta extends HookConsumerWidget {
  final String heroTag;
  final IconData? icon;
  final bool enabled;
  final Color? color;
  final void Function() onPressed;

  final Alignment alignment;

  const FloatingCta(
      {Key? key,
      this.heroTag = 'submit',
      this.enabled = true,
      this.icon,
      this.color,
      this.onPressed = doNothing,
      this.alignment = Alignment.bottomRight})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(loadingProvider);

    if (loading) {
      return CircularProgressIndicator(color: Theme.of(context).primaryColor)
          .alignment(Alignment.bottomRight);
    }

    return FloatingActionButton(
            heroTag: heroTag,
            backgroundColor: color ??
                (enabled ? Theme.of(context).primaryColor : Colors.grey),
            onPressed: enabled ? onPressed : doNothing,
            child: Icon(icon ?? FontAwesomeIcons.chevronRight,
                color: Colors.white))
        .alignment(Alignment.bottomRight);
  }
}
