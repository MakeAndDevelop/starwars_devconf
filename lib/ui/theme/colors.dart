import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class ThemeColors {
  static const Color white = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color yellow = Color.fromRGBO(255, 232, 31, 1.0);
  static const Color black = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color blue = Color.fromRGBO(0, 124, 210, 1.0);
  static const Color red = Color.fromRGBO(255, 52, 81, 1.0);
  static const Color orange = Color.fromRGBO(255, 215, 0, 1.0);
  static const Color background = Color.fromRGBO(243, 246, 248, 1.0);
  static const Color darkGray = Color.fromRGBO(35, 35, 35, 1.0);
  static const Color mediumDarkGray = Color.fromRGBO(56, 56, 56, 1.0);
  static const Color mediumGray = Color.fromRGBO(97, 110, 113, 1.0);
  static const Color lightGray = Color.fromRGBO(136, 151, 154, 1.0);

  static const Color textColor = Color(0xDDD8C48A);
  static const Color secondaryTextColor = Color(0xDDBFAEA9);
  static const Color borderColor = Color(0x22BFAEA9);
  static const Color solidBorderColor = Color(0x66BFAEA9);
  static const Color shadowColor = Color(0xDD000000);
  static const Color backgroundFilter = Color(0x3C000000);
  static const Color overlayColor = Color(0x11D8C48A);
}

class MaterialThemeColors {
  static MaterialColor get white => createMaterialColor(ThemeColors.white);
  static MaterialColor get yellow => createMaterialColor(ThemeColors.yellow);
  static MaterialColor get black => createMaterialColor(ThemeColors.black);
  static MaterialColor get blue => createMaterialColor(ThemeColors.blue);
  static MaterialColor get red => createMaterialColor(ThemeColors.red);
  static MaterialColor get orange => createMaterialColor(ThemeColors.orange);
  static MaterialColor get darkGrey => createMaterialColor(ThemeColors.darkGray);
  static MaterialColor get textColor => createMaterialColor(ThemeColors.textColor);
  static MaterialColor get secondaryTextColor => createMaterialColor(ThemeColors.secondaryTextColor);
}
