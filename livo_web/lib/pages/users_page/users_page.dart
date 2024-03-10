import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:livo_app/widgets/main_container.dart';
import 'package:livo_app/widgets/create_user_dialog.dart';

import '../../controllers/users_page_controller.dart';
import '../../widgets/users_table.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final controller = Get.find<UsersPageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        MainContainer(
          title: 'Usuários',
          subtitle: 'Gerencie os usuários da sua plataforma',
          action: _showCreateDialog,
          refresh: controller.getUsers,
          child: const UsersTable(),
        ),
      ],
    );
  }

  _showCreateDialog(context) {
    showDialog(
      builder: (BuildContext context) {
        return CreateUserDialog(controller: controller);
      },
      context: context,
    );
  }
}
