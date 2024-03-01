import 'package:flutter/material.dart';

class AppearanceApp extends StatelessWidget {
  const AppearanceApp({super.key});

  /// Appearance Setup
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: appThemes[ThemeMode.light],
      darkTheme: appThemes[ThemeMode.dark],
      home: const AppearanceWidget(),
    );
  }
}

class AppearanceWidget extends StatefulWidget {
  const AppearanceWidget({super.key});

  @override
  State<AppearanceWidget> createState() => _AppearanceWidgetState();
}

class _AppearanceWidgetState extends State<AppearanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20),
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary(context),
                AppColors.secondary(context)
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("👨‍💻",
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w700,
                  )),
              Text("@codervamp",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.text(context))),
              Text("codervamp.vercel.app",
                  style:
                      TextStyle(fontSize: 14, color: AppColors.text(context)))
            ],
          )),
    );
  }
}

// Colors Setup
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
