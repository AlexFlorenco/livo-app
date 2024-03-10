import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import 'controllers/users_page_controller.dart';
import 'pages/home_page/home_page.dart';
import 'shared/constants/livo_colors.dart';

void main() {
  Get.put(UsersPageController());
  runApp(
    const LivoWeb(),
  );
}

class LivoWeb extends StatelessWidget {
  const LivoWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        textTheme: const TextTheme(
          /* 
          display: Textos que são o foco principal em uma tela.
          headline: Títulos (Cabeçalhos) e subtítulos.
          title: Títulos em contextos menores que os cabeçalhos.
          body: Texto do corpo principal. 
          label: Rótulos, 
          */
          displayLarge: TextStyle(
              fontSize: 34.0,
              fontWeight: FontWeight.bold,
              color: LivoColors.darkTextColor),
          // displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          // displaySmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          // headlineLarge: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          // headlineMedium:
          //     TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          // headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
          // bodyLarge: TextStyle(fontSize: 18.0),
          // bodyMedium: TextStyle(fontSize: 16.0),
          // bodySmall: TextStyle(fontSize: 14.0),
          labelLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          labelMedium: TextStyle(
            fontSize: 16.0,
            color: LivoColors.darkTextColor,
          ),
          // labelSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          // floatingLabelStyle: TextStyle(color: LivoColors.primaryColor),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: LivoColors.mainPrimaryColor, width: 2.0),
          ),
        ),
        // textButtonTheme: TextButtonThemeData(
        //   style: TextButton.styleFrom(backgroundColor: LivoColors.primaryColor),
        // ),
      ),
      home: const HomePage(),
    );
  }
}
