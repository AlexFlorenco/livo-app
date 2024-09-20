import 'package:flutter/material.dart';
import 'package:livo_app/app/modules/auth/presenter/view_models/auth_view_model.dart';
import 'package:livo_app/app/modules/auth/presenter/widgets/social_auth_button_google.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/design_system/components/livo_email_form_field.dart';
import '../../../../core/design_system/components/livo_password_form_field.dart';
import '../../../../core/design_system/components/livo_text_button_bg.dart';
import '../../../../core/design_system/components/snackbar.dart';
import '../../../home/pages/home_page.dart';

class SignInForm extends StatefulWidget {
  final AuthViewModel authViewModel;
  const SignInForm(this.authViewModel, {super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    authViewModel = widget.authViewModel;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          LivoEmailFormField(controller: emailController),
          const SizedBox(height: 12),
          LivoPasswordFormField(controller: passwordController),
          const SizedBox(height: 22),
          LivoTextButtonBG(
            onPressed: () async {
              final result = await authViewModel.signIn(
                formKey: formKey,
                identifier: emailController.text,
                password: passwordController.text,
              );
              result.$1 != null
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      LivoSnackbar(
                        feedbackColor: AppColors.dangerColor,
                        message: result.$1!.message,
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomePage(
                          idUser: result.$2!.user.id.toString(),
                          nameUser: result.$2!.user.username,
                        ),
                      ),
                    );
            },
            label: 'Entrar',
          ),
          SocialAuthButtonGoogle(
            onPressed: () async {
              // var result = await controller.signInWithGoogle();

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
