import 'package:flutter/material.dart';

import '../shared/constants/livo_colors.dart';

class IconActionButton extends StatelessWidget {
  const IconActionButton({
    super.key,
    required this.color,
    required this.icon,
    required this.onPressed,
  });
  final Color color;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
      child: IconButton(
        onPressed: () => onPressed(),
        icon: Icon(
          icon,
          size: 18,
          color: LivoColors.lightTextColor,
        ),
      ),
    );
  }
}
