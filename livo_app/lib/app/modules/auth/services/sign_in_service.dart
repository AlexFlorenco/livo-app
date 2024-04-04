import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

import '../../../core/routes/routes.dart';

class SignInService {
  AsyncResult<Map<String, dynamic>, Map<String, dynamic>> signIn(
      String email, String senha) async {
    const urlSignIn = Routes.urlSignIn;

    try {
      var response = await http.post(
        Uri.parse(urlSignIn),
        body: {
          'email': email,
          'senha': senha,
        },
      );

      var jsonResponse = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Success(jsonResponse);
      }
      return Failure(jsonResponse);
    } catch (e) {
      return const Failure({"message": "Erro interno"});
    }
  }
}
