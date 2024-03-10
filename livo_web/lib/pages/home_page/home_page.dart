import 'package:flutter/material.dart';

import '../../widgets/livo_app_bar.dart';
import '../users_page/users_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: LivoAppBar(),
        body: TabBarView(
          children: [
            UsersPage(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
