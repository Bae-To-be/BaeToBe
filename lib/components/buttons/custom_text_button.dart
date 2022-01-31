import 'package:baetobe/domain/loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextButton extends HookConsumerWidget {
  final String text;
  final void Function() onPressed;

  const CustomTextButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(loadingProvider);

    if (loading) {
      return CircularProgressIndicator(color: Theme.of(context).primaryColor);
    }

    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }
}
