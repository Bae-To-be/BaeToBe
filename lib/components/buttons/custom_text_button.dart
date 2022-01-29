import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final bool loading;
  final void Function() onPressed;

  const CustomTextButton(
      {Key? key,
      required this.text,
      required this.loading,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return CircularProgressIndicator(color: Theme.of(context).primaryColor);
    }

    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }
}
