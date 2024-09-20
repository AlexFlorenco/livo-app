import 'package:flutter/material.dart';
import 'package:livo_app/app/core/themes/app_colors.dart';

class AnimatedContainerWidget extends StatelessWidget {
  final bool isExpanded;
  final List<Widget> children;
  const AnimatedContainerWidget({
    super.key,
    required this.isExpanded,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
      height: isExpanded ? deviceHeight * 0.8 : 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 6,
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
        color: AppColors.mainBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
