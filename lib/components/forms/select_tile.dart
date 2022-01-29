import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectTile extends StatelessWidget {
  final String title;
  final bool selected;
  final void Function()? onTap;

  const SelectTile(
      {Key? key, required this.title, required this.selected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFListTile(
        title: Text(
          title,
          style: GoogleFonts.openSans(
            textStyle: Theme.of(context).textTheme.subtitle1,
          ),
          textDirection: TextDirection.ltr,
        ),
        onTap: onTap,
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        color:
            selected ? Theme.of(context).primaryColorLight : Colors.transparent,
        selected: selected);
  }
}
