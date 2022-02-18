import 'package:baetobe/components/text_widgets.dart';
import 'package:baetobe/domain/loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextButton extends HookConsumerWidget {
  final String text;
  final TextWidgetType type;
  final Color? color;
  final void Function() onPressed;

  const CustomTextButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color,
      this.type = TextWidgetType.heading6})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(loadingProvider);

    if (loading) {
      return CircularProgressIndicator(color: Theme.of(context).primaryColor);
    }

    return TextButton(
      onPressed: onPressed,
      child: CustomTextWidget(
          text: text, type: type, withRow: false, color: color),
    );
  }
}
