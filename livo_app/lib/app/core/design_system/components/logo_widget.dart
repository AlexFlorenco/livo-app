import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livo_app/app/core/themes/app_colors.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: TextAnimator(
          'Livo',
          style: GoogleFonts.mali(
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(5, 4),
              )
            ],
            fontSize: 80,
            fontWeight: FontWeight.w600,
            color: AppColors.lightTextColor,
          ),
          incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
            duration: const Duration(seconds: 1),
          ),
          atRestEffect: WidgetRestingEffects.bounce(numberOfPlays: 1),
        ),
      ),
    );
  }
}
