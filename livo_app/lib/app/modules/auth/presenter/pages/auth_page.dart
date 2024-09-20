import 'package:flutter/material.dart';
import 'package:livo_app/app/core/design_system/components/animated_container_widget.dart';
import 'package:livo_app/app/core/design_system/components/auth_scaffold_widget.dart';
import 'package:livo_app/app/core/design_system/components/livo_text_button.dart';
import 'package:livo_app/app/core/design_system/components/livo_text_button_bg.dart';
import 'package:livo_app/app/core/design_system/components/logo_widget.dart';
import 'package:livo_app/app/di/di_container.dart';
import 'package:livo_app/app/modules/auth/presenter/widgets/sign_in_form.dart';
import 'package:livo_app/app/modules/auth/presenter/widgets/sign_up_form.dart';
import 'package:livo_app/app/modules/auth/presenter/view_models/auth_view_model.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    authViewModel = AuthViewModel(
      authWithEmail: DIContainer.instance.resolve(),
      authAccessToken: DIContainer.instance.resolve(),
    );
    authViewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffoldWidget(
      children: [
        const LogoWidget(),
        AnimatedContainerWidget(
          isExpanded: authViewModel.containerIsExpanded,
          children: [
            Text(
              'Embarque nessa jornada e transforme sua maneira de aprender.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 26),
            Visibility(
              visible: !authViewModel.signInFormIsDisplayed && !authViewModel.signUpFormIsDisplayed,
              child: Column(
                children: [
                  LivoTextButtonBG(
                    label: 'Criar conta',
                    onPressed: () => authViewModel.openSignUpForm(),
                  ),
                  LivoTextButton(
                    label: 'Entrar na minha conta',
                    onPressed: () => authViewModel.openSignInForm(),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: authViewModel.signUpFormIsDisplayed,
              child: SignUpForm(authViewModel),
            ),
            Visibility(
              visible: authViewModel.signInFormIsDisplayed,
              child: SignInForm(authViewModel),
            ),
            Visibility(
              visible: authViewModel.signInFormIsDisplayed || authViewModel.signUpFormIsDisplayed,
              child: LivoTextButton(
                label: 'Voltar',
                onPressed: () {
                  authViewModel.closeSignInForm();
                  authViewModel.closeSignUpForm();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
