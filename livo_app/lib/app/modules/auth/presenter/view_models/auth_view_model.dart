import 'package:flutter/material.dart';
import 'package:livo_app/app/modules/auth/domain/entities/auth_result.dart';
import 'package:livo_app/app/modules/auth/domain/errors/auth_exception.dart';
import 'package:livo_app/app/modules/auth/domain/usecases/auth_access_token.dart';
import 'package:livo_app/app/modules/auth/domain/usecases/auth_with_email.dart';

class AuthViewModel with ChangeNotifier {
  final AuthWithEmailInterface authWithEmail;
  final AuthAccessTokenInterface authAccessToken;

  AuthViewModel({
    required this.authWithEmail,
    required this.authAccessToken,
  });

  bool _containerIsExpanded = false;
  bool _signInFormIsDisplayed = false;
  bool _signUpFormIsDisplayed = false;

  bool get containerIsExpanded => _containerIsExpanded;
  bool get signInFormIsDisplayed => _signInFormIsDisplayed;
  bool get signUpFormIsDisplayed => _signUpFormIsDisplayed;

  void _expandContainer() {
    _containerIsExpanded = true;
  }

  void _shrinkContainer() {
    _containerIsExpanded = false;
  }

  void openSignUpForm() {
    _expandContainer();
    _signUpFormIsDisplayed = true;
    notifyListeners();
  }

  void closeSignUpForm() {
    _signUpFormIsDisplayed = false;
    _shrinkContainer();
    notifyListeners();
  }

  void openSignInForm() {
    _expandContainer();
    _signInFormIsDisplayed = true;
    notifyListeners();
  }

  void closeSignInForm() {
    _signInFormIsDisplayed = false;
    _shrinkContainer();
    notifyListeners();
  }

  Future<(AuthException?, AuthResult?)> signUp({
    required GlobalKey<FormState> formKey,
    required String username,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    if (!formKey.currentState!.validate()) {
      return (AuthException("Formulário inválido"), null);
    } else if (password != passwordConfirmation) {
      return (AuthException("As senhas não coincidem"), null);
    }

    var response = await authWithEmail.signUp(
      username,
      email,
      password,
    );

    if (response.$1 == null) {
      await authAccessToken.cacheToken(response.$2!.accessToken);
    }

    return response;
  }

  Future<(AuthException?, AuthResult?)> signIn({
    required GlobalKey<FormState> formKey,
    required String identifier,
    required String password,
  }) async {
    if (!formKey.currentState!.validate()) {
      return (AuthException("Formulário inválido"), null);
    }

    var response = await authWithEmail.signIn(
      identifier,
      password,
    );

    if (response.$1 == null) {
      await authAccessToken.cacheToken(response.$2!.accessToken);
    }

    return response;
  }

  // Future<UserModel?> signUpWithGoogle() async {
  //   var result = await _signUpWithGoogle.signUp();

  //   if (result != null) {
  //     return result;
  //   }
  //   return null;
  // }
}
