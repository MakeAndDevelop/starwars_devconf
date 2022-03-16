import 'package:flutter/painting.dart';

class Insets {
  static const double inset4 = 4;
  static const double inset8 = 8;
  static const double inset16 = 16;
  static const double inset24 = 24;
  static const double inset32 = 32;

  static const EdgeInsets all4 = EdgeInsets.all(inset4);
  static const EdgeInsets all8 = EdgeInsets.all(inset8);
  static const EdgeInsets all16 = EdgeInsets.all(inset16);

  static const EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: inset8);
  static const EdgeInsets horizontal4 = EdgeInsets.symmetric(horizontal: inset4);
  static const EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: inset16);

  static const EdgeInsets vertical8 = EdgeInsets.symmetric(vertical: inset8);
  static const EdgeInsets vertical4 = EdgeInsets.symmetric(vertical: inset4);
  static const EdgeInsets vertical16 = EdgeInsets.symmetric(vertical: inset16);
}
