import 'package:flutter/material.dart';
import 'package:livo_app/pages/sign_up_page.dart';

void main() {
  runApp(const MaterialApp(
    home: LivoApp(),
  ));
}

class LivoApp extends StatelessWidget {
  const LivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpPage(),
    );
  }
}
