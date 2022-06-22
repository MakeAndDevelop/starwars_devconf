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
          space: Insets.inset16,
          indent: Insets.inset16,
          endIndent: Insets.inset16,
          thickness: 1.3,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: ThemeColors.yellow),
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MaterialThemeColors.textColor,
        scaffoldBackgroundColor: ThemeColors.darkGray,
        backgroundColor: ThemeColors.darkGray,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialThemeColors.textColor,
          backgroundColor: ThemeColors.darkGray,
          accentColor: MaterialThemeColors.white,
          cardColor: ThemeColors.mediumDarkGray,
          errorColor: ThemeColors.red,
          brightness: Brightness.dark,
        ),
        cardTheme: CardTheme(
          color: Colors.transparent,
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.cornerRadius),
            side: const BorderSide(color: ThemeColors.borderColor),
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(color: ThemeColors.textColor),
          headline2: TextStyle(color: ThemeColors.textColor),
          headline3: TextStyle(color: ThemeColors.textColor),
          headline4: TextStyle(color: ThemeColors.textColor),
          headline5: TextStyle(color: ThemeColors.textColor),
          headline6: TextStyle(color: ThemeColors.textColor),
          bodyText1: TextStyle(color: ThemeColors.secondaryTextColor),
          bodyText2: TextStyle(color: ThemeColors.secondaryTextColor),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: ThemeColors.textColor,
          elevation: 0,
        ),
        dividerTheme: const DividerThemeData(
          space: Insets.inset32,
          indent: Insets.inset16,
          endIndent: Insets.inset16,
          thickness: 1.2,
          color: ThemeColors.secondaryTextColor,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: ThemeColors.textColor),
      );
}
