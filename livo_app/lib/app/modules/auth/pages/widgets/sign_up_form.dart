import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../home/pages/home_page.dart';
import '../../controllers/sign_up_controller.dart';
import '../../../../core/themes/livo_colors.dart';
import '../../../../core/widgets/livo_email_form_field.dart';
import '../../../../core/widgets/livo_password_form_field.dart';
import '../../../../core/widgets/livo_text_button.dart';
import '../../../../core/widgets/livo_text_button_bg.dart';
import '../../../../core/widgets/livo_text_form_field.dart';
import '../../../../core/widgets/snackbar.dart';
import 'social_auth_button_google.dart';
import '../../controllers/initial_page_store.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  SignUpController controller = SignUpController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<InitialPageStore>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          LivoTextFormField(
            controller: _nameController,
            prefixIcon: const Icon(Icons.person_outline),
            label: 'Nome',
          ),
          const SizedBox(height: 12),
          LivoEmailFormField(controller: _emailController),
          const SizedBox(height: 12),
          LivoPasswordFormField(controller: _passwordController),
          const SizedBox(height: 12),
          LivoPasswordFormField(
            controller: _passwordConfirmationController,
            isConfirmation: true,
          ),
          const SizedBox(height: 22),
          LivoTextButtonBG(
            onPressed: () async {
              var apiResponse = await controller.signUp(
                formKey: _formKey,
                name: _nameController.text,
                email: _emailController.text,
                password: _passwordController.text,
                passwordConfirmation: _passwordConfirmationController.text,
              );

              apiResponse.fold(
                  (success) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomePage(
                            idUser: success.id,
                            nameUser: success.name,
                          ),
                        ),
                      ),
                  (failure) => ScaffoldMessenger.of(context).showSnackBar(
                        LivoSnackbar(
                          feedbackColor: LivoColors.dangerColor,
                          message: failure,
                        ),
                      ));
            },
            label: 'Cadastrar',
          ),
          SocialAuthButtonGoogle(
            onPressed: () async {
              var result = await controller.signUpWithGoogle();

              if (result != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(
                      idUser: result.id,
                      nameUser: result.name,
                      photoUrl: result.photoUrl,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  LivoSnackbar(
                    feedbackColor: LivoColors.dangerColor,
                    message: "Falhou!",
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          LivoTextButton(
            onPressed: () {
              store.toggleExpanded();
              store.toggleDisplayingSignUp();
            },
            label: 'Voltar',
          )
        ],
      ),
    );
  }
}
