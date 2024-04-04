import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:livo_app/controllers/users_page_controller.dart';
import 'package:livo_app/widgets/delete_user_dialog.dart';
import 'package:livo_app/widgets/edit_user_dialog.dart';
import 'package:livo_app/widgets/icon_action_button.dart';
import 'package:livo_app/widgets/snackbar.dart';

import '../shared/constants/livo_colors.dart';

class UsersTable extends StatefulWidget {
  const UsersTable({
    super.key,
  });

  @override
  State<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  final usersPageController = Get.put(UsersPageController());

  @override
  void initState() {
    () async {
      String? response = await usersPageController.getUsers();

      if (response != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(LivoSnackbar(
          feedbackColor: LivoColors.dangerColor,
          message: response,
        ));
      }
    }();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.63,
        width: MediaQuery.of(context).size.width * 0.58,
        constraints: const BoxConstraints(minWidth: 600),
        child: Column(
          children: [
            const UsersTableHeader(),
            const SizedBox(height: 12),
            Obx(
              () => Expanded(
                  child: ListView.separated(
                itemCount: usersPageController.userList.length,
                itemBuilder: (_, index) => UsersTableItem(
                  id: usersPageController.userList[index].id,
                  name: usersPageController.userList[index].name,
                  email: usersPageController.userList[index].email,
                  password: usersPageController.userList[index].password,
                  controller: usersPageController,
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class UsersTableHeader extends StatelessWidget {
  const UsersTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 100,
            child: Text("ID", style: TextStyle(fontWeight: FontWeight.bold))),
        SizedBox(
            width: 150,
            child: Text("Nome", style: TextStyle(fontWeight: FontWeight.bold))),
        SizedBox(
            width: 200,
            child:
                Text("E-mail", style: TextStyle(fontWeight: FontWeight.bold))),
        SizedBox(
            width: 90,
            child: Text("Ações", style: TextStyle(fontWeight: FontWeight.bold)))
      ],
    );
  }
}

class UsersTableItem extends StatelessWidget {
  final String id;
  final String name;
  final String email;
  final String password;
  final UsersPageController controller;

  const UsersTableItem({
    super.key,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 100, child: Text(id, overflow: TextOverflow.ellipsis)),
        const Spacer(),
        SizedBox(width: 150, child: Text(name)),
        const Spacer(),
        SizedBox(width: 200, child: Text(email)),
        const Spacer(),
        SizedBox(
          width: 90,
          child: Row(
            children: [
              IconActionButton(
                  color: LivoColors.warningColor,
                  icon: Icons.edit,
                  onPressed: () {
                    _showEditDialog(context);
                  }),
              const SizedBox(width: 5),
              IconActionButton(
                  color: LivoColors.dangerColor,
                  icon: Icons.delete,
                  onPressed: () {
                    _showDeleteDialog(context);
                  }),
            ],
          ),
        )
      ],
    );
  }

  _showDeleteDialog(context) {
    showDialog(
      builder: (BuildContext context) {
        return DeleteUserDialog(
          controller: controller,
          id: id,
        );
      },
      context: context,
    );
  }

  _showEditDialog(context) {
    showDialog(
      builder: (BuildContext context) {
        return EditUserDialog(
            controller: controller,
            id: id,
            name: name,
            email: email,
            password: password,
            passwordConfirmation: password);
      },
      context: context,
    );
  }
}
