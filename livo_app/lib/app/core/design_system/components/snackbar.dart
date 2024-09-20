import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class LivoSnackbar extends SnackBar {
  LivoSnackbar({
    super.key,
    required Color feedbackColor,
    required String message,
  }) : super(
          content: Row(
            children: [
              const Icon(Icons.info, color: AppColors.lightTextColor),
              const SizedBox(width: 8),
              Text(
                message,
                style: const TextStyle(color: AppColors.lightTextColor),
              ),
            ],
          ),
          backgroundColor: feedbackColor,
          behavior: SnackBarBehavior.floating,
        );
}
