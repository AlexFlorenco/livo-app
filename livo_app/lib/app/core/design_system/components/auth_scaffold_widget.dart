import 'package:flutter/material.dart';
import 'package:livo_app/app/core/themes/app_colors.dart';
import 'package:livo_app/app/core/design_system/components/initial_background_widget.dart';

class AuthScaffoldWidget extends StatelessWidget {
  final List<Widget> children;
  const AuthScaffoldWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainPrimaryColor,
      body: Stack(
        children: [
          const InitialBackgroundWidget(),
          Column(
            children: children,
          )
        ],
      ),
    );
  }
}
