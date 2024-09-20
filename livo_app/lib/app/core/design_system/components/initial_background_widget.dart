import 'package:flutter/material.dart';

class InitialBackgroundWidget extends StatelessWidget {
  const InitialBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/initial_bg.png',
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }
}
