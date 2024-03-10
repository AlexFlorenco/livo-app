import 'package:flutter/material.dart';
import 'package:livo_app/shared/constants/livo_colors.dart';
import 'package:livo_app/widgets/icon_action_button.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
    required this.child,
    required this.title,
    required this.subtitle,
    required this.action,
    required this.refresh,
  });

  final Widget child;
  final String title;
  final String subtitle;
  final Function action;
  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      constraints: const BoxConstraints(minWidth: 450),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text(subtitle,
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
                const Spacer(),
                IconActionButton(
                  color: LivoColors.mainPrimaryColor,
                  icon: Icons.refresh,
                  onPressed: () => refresh(),
                ),
                const SizedBox(width: 5),
                IconActionButton(
                  color: LivoColors.mainPrimaryColor,
                  icon: Icons.add,
                  onPressed: () => action(context),
                ),
                const SizedBox(width: 16)
              ],
            ),
            const SizedBox(height: 26),
            child,
          ],
        ),
      ),
    );
  }
}
