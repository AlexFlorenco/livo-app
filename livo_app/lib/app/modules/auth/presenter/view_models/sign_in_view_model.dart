// import 'package:flutter/material.dart';
// import 'package:livo_app/app/modules/auth/interfaces/sign_in_with_google_interface.dart';
// import 'package:livo_app/app/modules/auth/data/models/user_model.dart';
// import 'package:result_dart/result_dart.dart';

// import '../../services/sign_in_firebase_service.dart';
// import '../../services/sign_in_service.dart';

// class SignInViewModel {
//   final ISignInWithGoogle _signInWithGoogle = FirebaseSignInService();

//   AsyncResult<Map<String, dynamic>, Map<String, dynamic>> signIn(
//     GlobalKey<FormState> formKey,
//     TextEditingController emailController,
//     TextEditingController passwordController,
//   ) async {
//     if (!formKey.currentState!.validate()) {
//       return const Failure({"message": "Formulário inválido"});
//     }

//     return await SignInService().signIn(
//       emailController.text,
//       passwordController.text,
//     );
//   }

//   Future<UserModel?> signInWithGoogle() async {
//     var result = await _signInWithGoogle.signIn();

//     if (result != null) {
//       return result;
//     }
//     return null;
//   }
// }
