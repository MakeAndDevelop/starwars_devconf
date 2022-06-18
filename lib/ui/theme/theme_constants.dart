import 'package:flutter/painting.dart';

class ThemeConstants {
  static const double elevation = 3.0;
  static const double barElevation = 6.0;
  static const double cornerRadius = 7.0;
  static const double largeCornerRadius = 42.0;
  static const double extraLargeCornerRadius = 140.0;
  static const Radius radius = Radius.circular(cornerRadius);
  static const Radius largeRadius = Radius.circular(largeCornerRadius);
  static const Radius extraLargeRadius = Radius.circular(extraLargeCornerRadius);
  static const double buttonHeight = 50.0;

  static const BorderRadius smallItemRadius = BorderRadius.only(
    topLeft: ThemeConstants.radius,
    topRight: ThemeConstants.radius,
    bottomRight: Radius.circular(27),
    bottomLeft: ThemeConstants.radius,
  );

  static const BorderRadius itemRadius = BorderRadius.only(
    topLeft: ThemeConstants.radius,
    topRight: ThemeConstants.radius,
    bottomRight: ThemeConstants.largeRadius,
    bottomLeft: ThemeConstants.radius,
  );

  static const BorderRadius itemInnerRadius = BorderRadius.only(
    topRight: ThemeConstants.radius,
    bottomRight: ThemeConstants.largeRadius,
  );

  static const BorderRadius mainItemRadius = BorderRadius.only(
    topRight: ThemeConstants.largeRadius,
    bottomRight: ThemeConstants.extraLargeRadius,
  );
}
