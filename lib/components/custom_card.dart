import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final bool? clip;
  final Widget content;
  final EdgeInsetsGeometry padding;

  const CustomCardWidget(
      {Key? key,
      this.clip = true,
      required this.content,
      this.padding = const EdgeInsets.only(top: 8)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: (clip == true) ? Clip.antiAlias : Clip.none,
          child: content,
        ),
      ),
    );
  }
}
