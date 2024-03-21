import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  signInWithGoogle() async {
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
