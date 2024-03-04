import 'package:flutter/material.dart';

import '../services/http_error_messages.dart';
import '../services/sign_in_service.dart';

class SignInController {
  Future<ResultCodes> signIn(
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    if (!formKey.currentState!.validate()) {
      return ResultCodes.invalidForm;
    }

    ResultCodes result = await SignInService().signIn(
      emailController.text,
      passwordController.text,
    );

    return result;
  }
}