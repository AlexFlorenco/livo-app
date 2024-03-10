import 'package:flutter/material.dart';
import 'package:livo_app/controllers/users_page_controller.dart';

import '../shared/constants/livo_colors.dart';
import 'livo_email_form_field.dart';
import 'livo_password_form_field.dart';
import 'livo_text_form_field.dart';
import 'snackbar.dart';

class EditUserDialog extends StatelessWidget {
  const EditUserDialog({
    super.key,
    required this.controller,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  final UsersPageController controller;
  final String id;
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: name);
    final emailController = TextEditingController(text: email);
    final passwordController = TextEditingController(text: password);
    final confirmpasswordController =
        TextEditingController(text: passwordConfirmation);

    return AlertDialog(
      actionsPadding: const EdgeInsets.only(right: 18, bottom: 20),
      contentPadding:
          const EdgeInsets.only(left: 22, top: 22, right: 22, bottom: 0),
      titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      contentTextStyle: Theme.of(context).textTheme.bodyLarge,
      title: const Row(
        children: [
          Icon(
            Icons.person_search,
            size: 30,
          ),
          SizedBox(width: 8),
          Text("Editar usuário"),
        ],
      ),
      content: SizedBox(
        width: 520,
        height: 130,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return constraints.maxWidth > 515
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LivoTextFormField(
                                controller: nameController,
                                prefixIcon: const Icon(Icons.person),
                                label: 'Nome',
                              ),
                              const SizedBox(width: 16),
                              LivoEmailFormField(controller: emailController),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LivoTextFormField(
                                controller: nameController,
                                prefixIcon: const Icon(Icons.person),
                                label: 'Nome',
                              ),
                              const SizedBox(width: 16),
                              LivoEmailFormField(controller: emailController),
                            ],
                          );
                  },
                ),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return constraints.maxWidth > 515
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LivoPasswordFormField(
                                  controller: passwordController),
                              const SizedBox(width: 16),
                              LivoPasswordFormField(
                                controller: confirmpasswordController,
                                isConfirmation: true,
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LivoPasswordFormField(
                                  controller: passwordController),
                              const SizedBox(width: 16),
                              LivoPasswordFormField(
                                controller: confirmpasswordController,
                                isConfirmation: true,
                              ),
                            ],
                          );
                  },
                )
              ],
            ),
          ),
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
            'Salvar',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: LivoColors.successColor,
                  fontWeight: FontWeight.normal,
                ),
          ),
          onPressed: () async {
            String snackbarMessage = "";
            Color snackbarColor = LivoColors.dangerColor;

            if (!formKey.currentState!.validate()) {
              snackbarMessage = "Formulário inválido";
            } else if (passwordController.text !=
                confirmpasswordController.text) {
              snackbarMessage = "As senhas não coincidem";
            } else {
              var response = await controller.updateUser(
                id,
                nameController.text,
                emailController.text,
                passwordController.text,
              );

              response.fold((success) {
                snackbarMessage = success;
                snackbarColor = LivoColors.successColor;
                Navigator.pop(context);
              }, (failure) {
                snackbarMessage = failure;
              });
            }

            ScaffoldMessenger.of(context).showSnackBar(LivoSnackbar(
              feedbackColor: snackbarColor,
              message: snackbarMessage,
            ));
          },
        ),
      ],
    );
  }
}
