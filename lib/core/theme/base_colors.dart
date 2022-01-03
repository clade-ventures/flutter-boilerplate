import 'package:flutter/material.dart';

class BaseColors {
  static Color black = Colors.black;
  static Color white = Colors.white;
  static const Color disableColor = Color(0xFFCFCFCF);
  static const Color primary = Color(0xFF101C42);
  static const MaterialColor materialPrimary = MaterialColor(
    0xFF101C42,
    <int, Color>{
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    },
  );

  // Neutral Colors
  static const Color neutral100 = Color(0xFF1F262C);
  static const Color neutral90 = Color(0xFF50555B);
  static const Color neutral80 = Color(0xFF6E7377);
  static const Color neutral70 = Color(0xFF818589);
  static const Color neutral60 = Color(0xFFA6A9AC);
  static const Color neutral50 = Color(0xFFC7C9CA);
  static const Color neutral40 = Color(0xFFE3E4E5);
  static const Color neutral30 = Color(0xFFEFEFF0);
  static const Color neutral20 = Color(0xFFF6F6F6);
  static const Color neutral10 = Color(0xFFFFFFFF);
}
