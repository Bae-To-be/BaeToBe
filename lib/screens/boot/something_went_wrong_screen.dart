import 'package:baetobe/components/screen_with_text.dart';
import 'package:baetobe/constants/typography.dart';
import 'package:flutter/material.dart';

class CouldNotLoadApp extends StatelessWidget {
  const CouldNotLoadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScreenWithText(
      BodyText.couldNotLoadApplication,
    );
  }
}
