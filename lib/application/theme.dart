import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const themeColor = Color(0xFF00838C);
const themeColorLight = Color(0xFFCCECEE);
const offWhite = Color(0xFFF2F2F2);
const offWhiteDark = Color(0xFFE5E5E5);

final theme = ThemeData(
    sliderTheme: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
        activeTrackColor: themeColor,
        inactiveTrackColor: themeColorLight,
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 5.0,
        thumbColor: themeColor,
        tickMarkShape: const RoundSliderTickMarkShape(),
        rangeTickMarkShape: const RoundRangeSliderTickMarkShape(),
        activeTickMarkColor: themeColor,
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: themeColor,
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
        )),
    primaryColor: themeColor,
    primaryColorLight: themeColorLight,
    textTheme: GoogleFonts.openSansTextTheme(const TextTheme(
      headline1: TextStyle(color: themeColor),
      headline2: TextStyle(color: themeColor, fontWeight: FontWeight.w600),
      headline3: TextStyle(color: themeColor),
      headline4: TextStyle(color: themeColor),
      headline5: TextStyle(color: themeColor, fontWeight: FontWeight.w600),
      headline6: TextStyle(color: themeColor),
    )));
