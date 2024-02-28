import 'package:codervamp/widgets/appearance/utils/colors.dart';
import 'package:codervamp/widgets/appearance/utils/themes.dart';
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
