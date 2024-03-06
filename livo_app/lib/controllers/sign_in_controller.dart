import 'package:flutter/material.dart';

import '../services/sign_in_service.dart';

class SignInController {
  Future signIn(
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    if (!formKey.currentState!.validate()) {
      // return ResultCodes.invalidForm;
    }

    // ResultCodes result = await SignInService().signIn(
    //   emailController.text,
    //   passwordController.text,
    // );
    // const result = ResultCodes.emailAlredyExists;
    return null;
  }
}
