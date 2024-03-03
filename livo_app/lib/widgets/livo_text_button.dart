import 'package:flutter/material.dart';

class LivoTextButton extends StatelessWidget {
  const LivoTextButton({
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
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
