import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../services/sign_in_service.dart';

class SignInController {
  AsyncResult<Map<String, dynamic>, Map<String, dynamic>> signIn(
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    if (!formKey.currentState!.validate()) {
      return const Failure({"message": "Formulário inválido"});
    }

    return await SignInService().signIn(
      emailController.text,
      passwordController.text,
    );
  }
}
