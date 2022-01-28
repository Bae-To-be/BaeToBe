import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenWithText extends StatelessWidget {
  final String text;

  const ScreenWithText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(color: Colors.black),
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          ),
        ));
  }
}
