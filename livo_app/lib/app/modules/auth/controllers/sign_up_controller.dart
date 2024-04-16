import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../interfaces/sign_up_with_google_interface.dart';
import '../models/user_model.dart';
import '../services/sign_up_firebase_service.dart';
import '../services/sign_up_service.dart';

class SignUpController {
  final ISignUpWithGoogle _signUpWithGoogle = FirebaseSignUpService();

  AsyncResult<UserModel, String> signUp({
    required GlobalKey<FormState> formKey,
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    if (!formKey.currentState!.validate()) {
      return const Failure("Formulário inválido");
    } else if (password != passwordConfirmation) {
      return const Failure("As senhas não coincidem");
    }

    var response = await SignUpService().signUp(name, email, password);

    return response.fold(
      (success) {
        print(success);
        var user = UserModel(
          id: success['id'],
          name: success['nome'],
          email: success['email'],
        );
        print(user);
        return Success(user);
      },
      (failure) => Failure(failure['message']),
    );
  }

  Future<UserModel?> signUpWithGoogle() async {
    var result = await _signUpWithGoogle.signUp();

    if (result != null) {
      return result;
    }
    return null;
  }
}
