import 'package:codervamp/appearance/utils/colors.dart';
import 'package:flutter/material.dart';

final Map<ThemeMode, ThemeData> appThemes = {
  ThemeMode.light: ThemeData(
    primaryColor: LightThemeColors.primary,
    brightness: Brightness.light,
  ),
  ThemeMode.dark: ThemeData(
    primaryColor: DarkThemeColors.primary,
    brightness: Brightness.dark,
  )
};
