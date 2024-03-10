import 'package:flutter/material.dart';

import '../shared/constants/livo_colors.dart';

class LivoSnackbar extends SnackBar {
  LivoSnackbar({
    super.key,
    required Color feedbackColor,
    required String message,
  }) : super(
          content: Row(
            children: [
              const Icon(Icons.info, color: LivoColors.lightTextColor),
              const SizedBox(width: 8),
              Text(
                message,
                style: const TextStyle(color: LivoColors.lightTextColor),
              ),
            ],
          ),
          backgroundColor: feedbackColor,
          behavior: SnackBarBehavior.floating,
          width: 300,
        );
}
