import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  signUpWithGoogle() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await auth.signInWithCredential(credential);
      }
    } catch (e) {
      print('error');
    }
  }
}
