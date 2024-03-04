import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../shared/constants/livo_colors.dart';
import '../../widgets/livo_text_button.dart';
import '../../widgets/livo_text_button_bg.dart';
import 'forms/sign_in_form.dart';
import 'store/initial_page_store.dart';
import 'forms/sign_up_form.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<InitialPageStore>(context);

    return Scaffold(
      backgroundColor: LivoColors.mainPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Livo App',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Observer(
            builder: (BuildContext context) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 22,
              ),
              height: store.hasExpanded
                  ? MediaQuery.of(context).size.height * 0.8
                  : 250,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 6,
                    blurRadius: 16,
                    offset: const Offset(0, 5),
                  ),
                ],
                color: LivoColors.mainBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Embarque nessa jornada e transforme sua maneira de aprender.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 26),
                    store.hasExpanded
                        ? store.displayingSignUpForm
                            ? const SignUpForm()
                            : const SignInForm()
                        : Column(
                            children: [
                              LivoTextButtonBG(
                                label: 'Criar conta',
                                onPressed: () {
                                  store.toggleExpanded();
                                  store.toggleDisplayingSignUp();
                                },
                              ),
                              LivoTextButton(
                                label: 'Entrar na minha conta',
                                onPressed: () {
                                  store.toggleExpanded();
                                },
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}