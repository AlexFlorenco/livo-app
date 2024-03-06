import 'package:flutter/material.dart';

import '../services/sign_up_service.dart';

class SignUpController {
  Future<String?> signUp({
    required GlobalKey<FormState> formKey,
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    if (!formKey.currentState!.validate()) {
      return "Formulário inválido";
    } else if (password != passwordConfirmation) {
      return "As senhas não coincidem";
    }

    var response = await SignUpService().signUp(name, email, password);

    if (response != null) {
      return response["message"];
    }

    return null;
  }
}
