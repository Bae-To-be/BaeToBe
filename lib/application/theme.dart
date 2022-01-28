import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const themeColor = Color(0xFF00838C);
const themeColorLight = Color(0xFFCCECEE);

final theme = ThemeData(
    sliderTheme: const SliderThemeData(
        activeTrackColor: themeColor,
        inactiveTrackColor: themeColorLight,
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: themeColor,
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
        tickMarkShape: RoundSliderTickMarkShape(),
        rangeTickMarkShape: RoundRangeSliderTickMarkShape(),
        activeTickMarkColor: themeColor,
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: themeColor,
        valueIndicatorTextStyle: TextStyle(
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
