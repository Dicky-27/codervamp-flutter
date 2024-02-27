import 'package:flutter/material.dart';

abstract class LightThemeColors {
  static Color get text => Colors.black;
  static Color get primary => Colors.white;
  static Color get secondary => Colors.white;
}

abstract class DarkThemeColors {
  static Color get text => Colors.white;
  static Color get primary => Colors.deepPurple;
  static Color get secondary => Colors.teal;
}

abstract class AppColors {
  static Color text(BuildContext context) => ThemedColor(
        light: LightThemeColors.text,
        dark: DarkThemeColors.text,
      ).getColor(context);

  static Color primary(BuildContext context) => ThemedColor(
        light: LightThemeColors.primary,
        dark: DarkThemeColors.primary,
      ).getColor(context);

  static Color secondary(BuildContext context) => ThemedColor(
        light: LightThemeColors.secondary,
        dark: DarkThemeColors.secondary,
      ).getColor(context);
}

class ThemedColor {
  final Color light;
  final Color dark;

  const ThemedColor({
    required this.light,
    required this.dark,
  });

  Color getColor(BuildContext context) {
    switch (Theme.of(context).brightness) {
      case Brightness.light:
        return light;
      case Brightness.dark:
        return dark;
    }
  }
}
