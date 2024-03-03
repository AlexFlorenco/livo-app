import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/sign_up_controller.dart';
import '../../../services/http_error_messages.dart';
import '../../../shared/constants/livo_colors.dart';
import '../../../widgets/livo_email_form_field.dart';
import '../../../widgets/livo_password_form_field.dart';
import '../../../widgets/livo_text_button.dart';
import '../../../widgets/livo_text_button_bg.dart';
import '../../../widgets/livo_text_form_field.dart';
import '../../../widgets/snackbar.dart';
import '../../home_page/home_page.dart';
import '../store/initial_page_store.dart';

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
              ResultCodes result = await controller.signUp(
                _formKey,
                _nameController,
                _emailController,
                _passwordController,
                _passwordConfirmationController,
              );

              String? messageError =
                  HTTPErrorMessages.describeResultCodes(result);

              messageError == null
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomePage(),
                      ),
                    )
                  : ScaffoldMessenger.of(context).showSnackBar(
                      LivoSnackbar(
                        feedbackColor: LivoColors.dangerColor,
                        message: messageError,
                      ),
                    );
            },
            label: 'Cadastrar',
          ),
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
