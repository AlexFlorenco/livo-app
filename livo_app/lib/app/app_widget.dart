import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/pages/auth_page.dart';
import 'core/themes/livo_colors.dart';

class LivoApp extends StatelessWidget {
  const LivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 34.0,
              fontWeight: FontWeight.bold,
              color: LivoColors.darkTextColor),
          titleLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: LivoColors.darkTextColor,
          ),
          titleMedium: TextStyle(
            fontSize: 18.0,
            height: 1.2,
            letterSpacing: 0,
            color: LivoColors.darkTextColor,
          ),
          titleSmall: TextStyle(
            fontSize: 16.0,
            color: LivoColors.darkTextColor,
          ),
          labelLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          labelMedium: TextStyle(
            fontSize: 16.0,
            color: LivoColors.darkTextColor,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: LivoColors.mainPrimaryColor, width: 2.0),
          ),
        ),
      ),
      // home: const InitialPage(),
    );
  }
}
