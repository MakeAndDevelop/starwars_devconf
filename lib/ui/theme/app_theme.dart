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
          elevation: ThemeConstants.elevation, //ThemeConstants.elev
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.cornerRadius),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: ThemeColors.black,
          elevation: 0,
        ),
        dividerTheme: const DividerThemeData(
          space: Insets.inset32,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MaterialThemeColors.yellow,
        scaffoldBackgroundColor: ThemeColors.darkGray,
        backgroundColor: ThemeColors.darkGray,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialThemeColors.yellow,
          backgroundColor: ThemeColors.darkGray,
          accentColor: MaterialThemeColors.white,
          cardColor: ThemeColors.mediumDarkGray,
          errorColor: ThemeColors.red,
          brightness: Brightness.dark,
        ),
        cardTheme: CardTheme(
          elevation: ThemeConstants.elevation, //ThemeConstants.elev
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          color: ThemeColors.mediumDarkGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.cornerRadius),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: ThemeColors.yellow,
          elevation: 0,
        ),
        dividerTheme: const DividerThemeData(
          space: Insets.inset32,
        ),
      );
}
