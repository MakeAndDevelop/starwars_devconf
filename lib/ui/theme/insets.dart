import 'package:flutter/painting.dart';

class Insets {
  static const double inset4 = 4;
  static const double inset8 = 8;
  static const double inset12 = 12;
  static const double inset16 = 16;
  static const double inset24 = 24;
  static const double inset32 = 32;
  static const double inset40 = 40;
  static const double inset56 = 56;

  static const EdgeInsets zero = EdgeInsets.zero;
  static const EdgeInsets all4 = EdgeInsets.all(inset4);
  static const EdgeInsets all8 = EdgeInsets.all(inset8);
  static const EdgeInsets all12 = EdgeInsets.all(inset12);
  static const EdgeInsets all16 = EdgeInsets.all(inset16);
  static const EdgeInsets all32 = EdgeInsets.all(inset32);
  static const EdgeInsets all40 = EdgeInsets.all(inset40);

  static const EdgeInsets ltr16 = EdgeInsets.only(
    left: inset16,
    right: inset16,
    top: inset16,
    bottom: inset8,
  );

  static const EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: inset8);
  static const EdgeInsets horizontal4 = EdgeInsets.symmetric(horizontal: inset4);
  static const EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: inset16);

  static const EdgeInsets vertical8 = EdgeInsets.symmetric(vertical: inset8);
  static const EdgeInsets vertical4 = EdgeInsets.symmetric(vertical: inset4);
  static const EdgeInsets vertical16 = EdgeInsets.symmetric(vertical: inset16);

  static const EdgeInsets right8 = EdgeInsets.only(right: inset8);
  static const EdgeInsets right4 = EdgeInsets.only(right: inset4);
  static const EdgeInsets right16 = EdgeInsets.only(right: inset16);

  static const EdgeInsets left8 = EdgeInsets.only(left: inset8);
  static const EdgeInsets left4 = EdgeInsets.only(left: inset4);
  static const EdgeInsets left16 = EdgeInsets.only(left: inset16);

  static const EdgeInsets listItem16 = EdgeInsets.symmetric(horizontal: inset16, vertical: inset8);
  static const EdgeInsets firstListItem16 = EdgeInsets.only(left: inset16, right: inset8);
  static const EdgeInsets lastListItem16 = EdgeInsets.only(right: inset16, left: inset8);
  static const EdgeInsets horizontalListItem16 = EdgeInsets.symmetric(vertical: inset16, horizontal: inset8);
}
