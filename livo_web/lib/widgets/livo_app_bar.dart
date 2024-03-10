import 'package:flutter/material.dart';

import '../shared/constants/livo_colors.dart';

class LivoAppBar extends StatefulWidget implements PreferredSizeWidget {
  const LivoAppBar({super.key});

  @override
  State<LivoAppBar> createState() => _LivoAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _LivoAppBarState extends State<LivoAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: LivoColors.mainPrimaryColor,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Livo",
          ),
          SizedBox(
            width: 180,
            child: TabBar(
              unselectedLabelStyle: TextStyle(
                color: LivoColors.lightTextColor,
              ),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(
                  child: Text(
                    "Usuários",
                  ),
                ),
                Tab(
                  child: Text(
                    "Livros",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
