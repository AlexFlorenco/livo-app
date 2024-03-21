import 'package:flutter/material.dart';

import '../shared/constants/livo_colors.dart';

class SocialAuthButtonGoogle extends StatelessWidget {
  const SocialAuthButtonGoogle({
    super.key,
    required this.onPressed,
  });

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Stack(alignment: Alignment.center, children: [
          const Divider(),
          Container(
            alignment: Alignment.center,
            width: 40,
            color: Colors.white,
            child: Text(
              'ou',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ]),
        const SizedBox(height: 12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 46,
          child: TextButton(
            onPressed: () => onPressed(),
            style: TextButton.styleFrom(
              elevation: 1,
              shadowColor: Colors.grey,
              backgroundColor: LivoColors.lightTextColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logos/google.png',
                  width: 24,
                ),
                const SizedBox(width: 20),
                Text(
                  'Entrar com o Google',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: LivoColors.darkTextColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
