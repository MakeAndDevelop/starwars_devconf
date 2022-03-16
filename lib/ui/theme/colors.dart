import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class ThemeColors {
  static const Color white = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color blue = Color.fromRGBO(0, 124, 210, 1.0);
  static const Color red = Color.fromRGBO(255, 52, 81, 1.0);
  static const Color orange = Color.fromRGBO(255, 215, 0, 1.0);
  static const Color background = Color.fromRGBO(243, 246, 248, 1.0);
  static const Color darkGray = Color.fromRGBO(35, 35, 35, 1.0);
  static const Color mediumGray = Color.fromRGBO(97, 110, 113, 1.0);
  static const Color lightGray = Color.fromRGBO(136, 151, 154, 1.0);
}

class MaterialThemeColors {
  static MaterialColor get white => createMaterialColor(ThemeColors.white);
  static MaterialColor get blue => createMaterialColor(ThemeColors.blue);
  static MaterialColor get red => createMaterialColor(ThemeColors.red);
  static MaterialColor get orange => createMaterialColor(ThemeColors.orange);
  static MaterialColor get darkGrey => createMaterialColor(ThemeColors.darkGray);
}
