import 'package:flutter/material.dart';
import 'package:livo_app/widgets/social_auth_button_google.dart';
import 'package:provider/provider.dart';

import '../../../controllers/sign_in_controller.dart';
import '../../../shared/constants/livo_colors.dart';
import '../../../widgets/livo_email_form_field.dart';
import '../../../widgets/livo_password_form_field.dart';
import '../../../widgets/livo_text_button.dart';
import '../../../widgets/livo_text_button_bg.dart';
import '../../../widgets/snackbar.dart';
import '../../home_page/home_page.dart';
import '../store/initial_page_store.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  SignInController controller = SignInController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<InitialPageStore>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          LivoEmailFormField(controller: _emailController),
          const SizedBox(height: 12),
          LivoPasswordFormField(controller: _passwordController),
          const SizedBox(height: 22),
          LivoTextButtonBG(
            onPressed: () async {
              var result = await controller.signIn(
                _formKey,
                _emailController,
                _passwordController,
              );

              result.fold(
                  (success) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomePage(
                            idUser: success["id"],
                            nameUser: success["nome"],
                          ),
                        ),
                      ),
                  (failure) => ScaffoldMessenger.of(context).showSnackBar(
                        LivoSnackbar(
                          feedbackColor: LivoColors.dangerColor,
                          message: failure["message"]!,
                        ),
                      ));
            },
            label: 'Entrar',
          ),
          SocialAuthButtonGoogle(
            onPressed: () {
              try {
                final user = controller.signInWithGoogle();
                print(user);
              } catch (e) {
                print('erro');
              }
            },
          ),
          const SizedBox(height: 20),
          LivoTextButton(
            onPressed: () {
              store.toggleExpanded();
            },
            label: 'Voltar',
          ),
        ],
      ),
    );
  }
}
