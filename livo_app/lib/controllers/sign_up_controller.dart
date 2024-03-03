import 'package:flutter/material.dart';

import '../services/http_error_messages.dart';
import '../services/sign_in_service.dart';
import '../services/sign_up_service.dart';

class SignUpController {
  Future<ResultCodes> signUp(
    GlobalKey<FormState> formKey,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController passwordConfirmationController,
  ) async {
    if (passwordController.text != passwordConfirmationController.text) {
      return ResultCodes.passwordsDoNotMatch;
    } else if (!formKey.currentState!.validate()) {
      return ResultCodes.invalidForm;
    }

    ResultCodes result = await SignUpService().signUp(
      nameController.text,
      emailController.text,
      passwordController.text,
    );

    if (result == ResultCodes.success) {
      result = await SignInService().signIn(
        emailController.text,
        passwordController.text,
      );
    }
    return result;
  }
}
