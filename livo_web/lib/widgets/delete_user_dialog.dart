import 'package:flutter/material.dart';
import 'package:livo_app/controllers/users_page_controller.dart';

import '../shared/constants/livo_colors.dart';
import 'snackbar.dart';

class DeleteUserDialog extends StatelessWidget {
  const DeleteUserDialog({
    super.key,
    required this.controller,
    required this.id,
  });

  final UsersPageController controller;
  final String id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(right: 18, bottom: 20),
      titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      contentTextStyle: Theme.of(context).textTheme.bodyLarge,
      title: const Row(
        children: [
          Icon(
            Icons.person_remove,
            size: 30,
          ),
          SizedBox(width: 8),
          Text("Remover usuário"),
        ],
      ),
      content: const SizedBox(
        width: 350,
        height: 35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ao continuar, você apagará o usuário definitivamente.'),
            Text('Esta ação não pode ser revertida!'),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancelar',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.normal),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            'Remover',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: LivoColors.dangerColor,
                  fontWeight: FontWeight.normal,
                ),
          ),
          onPressed: () async {
            String snackbarMessage = "";
            Color snackbarColor = LivoColors.dangerColor;

            var response = await controller.deleteUser(id);

            response.fold((success) {
              snackbarMessage = success;
              snackbarColor = LivoColors.successColor;
              Navigator.pop(context);
            }, (failure) {
              snackbarMessage = failure;
              Navigator.pop(context);
            });
            
            if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(LivoSnackbar(
              feedbackColor: snackbarColor,
              message: snackbarMessage,
            ));
            }
          },
        ),
      ],
    );
  }
}
