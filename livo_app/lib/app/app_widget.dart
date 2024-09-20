import 'package:flutter/material.dart';
import 'package:livo_app/app/di/di_container.dart';
import 'package:livo_app/app/modules/auth/domain/usecases/auth_access_token.dart';
import 'package:livo_app/app/modules/auth/presenter/pages/auth_page.dart';
import 'package:livo_app/app/modules/home/pages/home_page.dart';
import 'core/themes/app_colors.dart';

class LivoApp extends StatefulWidget {
  const LivoApp({super.key});

  @override
  State<LivoApp> createState() => _LivoAppState();
}

class _LivoAppState extends State<LivoApp> {
  late final AuthAccessTokenInterface authAccessToken;
  Widget _defaultHome = const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    authAccessToken = DIContainer.instance.resolve();
    _checkToken();
  }

  Future<void> _checkToken() async {
    final result = await authAccessToken.getToken();

    if (result.$2 != null) {
      setState(() {
        _defaultHome = const HomePage(
          idUser: 'Oii',
          nameUser: 'Oii',
        );
      });
    } else {
      setState(() {
        _defaultHome = const AuthPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 34.0,
              fontWeight: FontWeight.bold,
              color: AppColors.darkTextColor),
          titleLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: AppColors.darkTextColor,
          ),
          titleMedium: TextStyle(
            fontSize: 18.0,
            height: 1.2,
            letterSpacing: 0,
            color: AppColors.darkTextColor,
          ),
          titleSmall: TextStyle(
            fontSize: 16.0,
            color: AppColors.darkTextColor,
          ),
          labelLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          labelMedium: TextStyle(
            fontSize: 16.0,
            color: AppColors.darkTextColor,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.mainPrimaryColor, width: 2.0),
          ),
        ),
      ),
      home: _defaultHome,
    );
  }
}
