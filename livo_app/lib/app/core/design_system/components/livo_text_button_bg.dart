import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class LivoTextButtonBG extends StatelessWidget {
  const LivoTextButtonBG({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () => onPressed(),
        style: TextButton.styleFrom(
          backgroundColor: AppColors.mainPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: AppColors.lightTextColor),
        ),
      ),
    );
  }
}
