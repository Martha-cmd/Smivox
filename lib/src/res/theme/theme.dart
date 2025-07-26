import 'package:flutter/material.dart';
import '../../commons/app_colors.dart';

class AppTheme {
  static getLightTheme(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return themeData.copyWith(
      scaffoldBackgroundColor: AppColors.white,
      useMaterial3: true,
      primaryColor: AppColors.primary,
      dividerColor: AppColors.lightGrey,
      cardColor: AppColors.lightGrey,
      dialogBackgroundColor: AppColors.white,
      brightness: Brightness.light,
      // splashColor: AppColors.primary,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
      ),
      shadowColor: AppColors.black.withOpacity(0.1),
      colorScheme: themeData.colorScheme.copyWith(
        primary: AppColors.primary,
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          color: AppColors.black,
        ),
        headlineLarge: TextStyle(
          color: AppColors.black,
        ),
        headlineSmall: TextStyle(
          color: AppColors.textGrey,
        ),
      ),
      focusColor: AppColors.lightGrey,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
      ),
    );
  }

  static getDarkTheme(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return themeData.copyWith(
      scaffoldBackgroundColor: AppColors.black,
      useMaterial3: true,
      primaryColor: AppColors.primary,
      dividerColor: AppColors.darkGrey.withOpacity(0.2),
      brightness: Brightness.dark,
      cardColor: AppColors.darkGrey.withOpacity(0.85),
      dialogBackgroundColor: AppColors.black,
      secondaryHeaderColor: AppColors.darkGrey.withOpacity(0.85),
      splashColor: AppColors.primary,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.black,
      ),
      shadowColor: Colors.transparent,
      colorScheme: themeData.colorScheme.copyWith(
        primary: AppColors.primary,
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          color: AppColors.white,
        ),
        headlineLarge: TextStyle(
          color: AppColors.white,
        ),
        headlineSmall: TextStyle(
          color: AppColors.textGrey,
        ),
      ),
      focusColor: AppColors.containerColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.black,
      ),
    );
  }

  static ThemeData getColorsTheme(BuildContext context) {
    return Theme.of(context);
  }

  static Color getTextColor(BuildContext context) {
    return getColorsTheme(context).textTheme.headlineLarge!.color!;
  }

  static Color getContainerColor(BuildContext context) {
    return getColorsTheme(context).focusColor;
  }

  static getHintTextColor(BuildContext context) {
    return getColorsTheme(context).textTheme.headlineSmall!.color;
  }

  static getScaffoldColor(BuildContext context) {
    return getColorsTheme(context).scaffoldBackgroundColor;
  }

  static getCardColor(BuildContext context) {
    return getColorsTheme(context).cardColor;
  }

  static getDividerColor(BuildContext context) {
    return getColorsTheme(context).dividerColor;
  }

  static getPrimaryColor(BuildContext context) {
    return getColorsTheme(context).primaryColor;
  }

  static Color getSheetColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF545454)
        : AppColors.lightGrey;
  }

  static getShadowColor(BuildContext context) {
    return getColorsTheme(context).shadowColor;
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
