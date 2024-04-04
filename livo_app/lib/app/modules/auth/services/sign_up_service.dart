import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../../../core/routes/routes.dart';

class SignUpService {
  Future<Map<String, dynamic>?> signUp(
      String nome, String email, String senha) async {
    const urlSignUp = Routes.urlSignUp;
    try {
      var response = await http.post(
        Uri.parse(urlSignUp),
        body: {
          'nome': nome,
          'email': email,
          'senha': senha,
        },
      );

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 201) {
        return jsonResponse;
      }
    } catch (e) {
      return {"message": "Erro interno"};
    }

    return null;
  }
}
