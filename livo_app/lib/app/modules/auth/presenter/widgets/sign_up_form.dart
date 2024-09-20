import 'package:flutter/material.dart';

import '../../../home/pages/home_page.dart';
import '../view_models/auth_view_model.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/design_system/components/livo_email_form_field.dart';
import '../../../../core/design_system/components/livo_password_form_field.dart';
import '../../../../core/design_system/components/livo_text_button_bg.dart';
import '../../../../core/design_system/components/livo_text_form_field.dart';
import '../../../../core/design_system/components/snackbar.dart';
import 'social_auth_button_google.dart';

class SignUpForm extends StatefulWidget {
  final AuthViewModel authViewModel;
  const SignUpForm(this.authViewModel, {super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController passwordConfirmationController;
  late final AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    authViewModel = widget.authViewModel;
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          LivoTextFormField(
            controller: usernameController,
            prefixIcon: const Icon(Icons.person_outline),
            label: 'Nome',
          ),
          const SizedBox(height: 12),
          LivoEmailFormField(controller: emailController),
          const SizedBox(height: 12),
          LivoPasswordFormField(controller: passwordController),
          const SizedBox(height: 12),
          LivoPasswordFormField(controller: passwordConfirmationController, isConfirmation: true),
          const SizedBox(height: 22),
          LivoTextButtonBG(
            onPressed: () async {
              final (exception, result) = await authViewModel.signUp(
                formKey: formKey,
                username: usernameController.text,
                email: emailController.text,
                password: passwordController.text,
                passwordConfirmation: passwordConfirmationController.text,
              );
              exception != null
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      LivoSnackbar(
                        feedbackColor: AppColors.dangerColor,
                        message: exception.message,
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomePage(
                          idUser: result!.user.id.toString(),
                          nameUser: result.user.username,
                        ),
                      ),
                    );
            },
            label: 'Cadastrar',
          ),
          SocialAuthButtonGoogle(
            onPressed: () async {
              // var result = await viewModel.signUpWithGoogle();

              // if (result != null) {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (_) => HomePage(
              //         idUser: '0',
              //         nameUser: 'name',
              //         // idUser: result.id,
              //         // nameUser: result.name,
              //         // photoUrl: result.photoUrl,
              //       ),
              //     ),
              //   );
              // } else {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     LivoSnackbar(
              //       feedbackColor: AppColors.dangerColor,
              //       message: "Falhou!",
              //     ),
              //   );
              // }
            },
          ),
        ],
      ),
    );
  }
}
