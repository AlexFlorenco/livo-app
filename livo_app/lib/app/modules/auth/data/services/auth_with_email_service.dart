import 'dart:convert';

import 'package:livo_app/app/core/routes/api_routes.dart';
import 'package:livo_app/app/modules/auth/data/models/auth_result_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthWithEmailServiceInterface {
  Future<AuthResultModel> signUp(
      String username, String email, String password);
  Future<AuthResultModel> signIn(String identifier, String password);
}

class AuthWithEmailService implements AuthWithEmailServiceInterface {
  @override
  Future<AuthResultModel> signUp(
    String username,
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        ApiRoutes.urlSignUp,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        AuthResultModel resultSignUp =
            AuthResultModel.fromJson(jsonDecode(response.body));
        return resultSignUp;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        String errorMessage =
            errorResponse['error']['message'] ?? 'Erro desconhecido';
        throw Exception(errorMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResultModel> signIn(
    String identifier,
    String password,
  ) async {
    try {
      final response = await http.post(
        ApiRoutes.urlSignIn,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "identifier": identifier,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        AuthResultModel resultSignIn =
            AuthResultModel.fromJson(jsonDecode(response.body));
        return resultSignIn;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        String errorMessage =
            errorResponse['error']['message'] ?? 'Erro desconhecido';
        throw Exception(errorMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
