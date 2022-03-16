import 'package:flutter/material.dart';

import '../ui.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primarySwatch: MaterialThemeColors.blue,
        scaffoldBackgroundColor: ThemeColors.background,
        backgroundColor: ThemeColors.background,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialThemeColors.blue,
          backgroundColor: ThemeColors.background,
          accentColor: MaterialThemeColors.orange,
          cardColor: ThemeColors.white,
          errorColor: ThemeColors.red,
        ),
        cardTheme: CardTheme(
          elevation: ThemeConstants.cornerRadius, //ThemeConstants.elev
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.cornerRadius),
          ),
        ),
      );
}
