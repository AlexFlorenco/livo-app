import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/initial_page/initial_page.dart';
import 'pages/initial_page/store/initial_page_store.dart';
import 'shared/constants/livo_colors.dart';

void main() {
  runApp(
    Provider<InitialPageStore>(
      create: (_) => InitialPageStore(),
      child: const LivoApp(),
    ),
  );
}

class LivoApp extends StatelessWidget {
  const LivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
            borderSide: BorderSide(
                color: LivoColors.mainPrimaryColor,
                width:
                    2.0), // Define a cor da borda quando o campo está selecionado
          ),
        ),
        // textButtonTheme: TextButtonThemeData(
        //   style: TextButton.styleFrom(backgroundColor: LivoColors.primaryColor),
        // ),
      ),
      home: const InitialPage(),
    );
  }
}
