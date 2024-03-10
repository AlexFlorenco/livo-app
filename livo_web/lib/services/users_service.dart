import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';
import 'dart:convert' as convert;

import '../shared/constants/routes.dart';

class UsersService {
  AsyncResult<Map<String, dynamic>, Map<String, dynamic>> getUsers() async {
    const urlGetUsers = Routes.urlGetUsers;

    try {
      var response = await http.get(Uri.parse(urlGetUsers));

      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

      if (response.statusCode == 200) {
        return Success(jsonResponse);
      }
      return Failure(jsonResponse);
    } catch (e) {
      return const Failure({"message": "Erro interno"});
    }
  }

  AsyncResult<Map<String, dynamic>, Map<String, dynamic>> deleteUser(
      String id) async {
    const urlDeleteUser = Routes.urlDeleteUser;

    try {
      var response = await http.delete(Uri.parse('$urlDeleteUser/$id'));

      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

      if (response.statusCode == 200) {
        return Success(jsonResponse);
      }
      return Failure(jsonResponse);
    } catch (e) {
      return const Failure({"message": "Erro interno"});
    }
  }

  AsyncResult<Map<String, dynamic>, Map<String, dynamic>> updateUser(
      String id, String name, String email, String senha) async {
    const urlUpdateUser = Routes.urlUpdateUser;

    try {
      var response = await http.put(Uri.parse('$urlUpdateUser/$id'), body: {
        "nome": name,
        "email": email,
        "senha": senha,
      });

      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

      if (response.statusCode == 200) {
        return Success(jsonResponse);
      }
      return Failure(jsonResponse);
    } catch (e) {
      return const Failure({"message": "Erro interno"});
    }
  }

  AsyncResult<Map<String, dynamic>, Map<String, dynamic>> createUser(
      String name, String email, String password) async {
    const urlCreateUser = Routes.urlSignUp;

    try {
      var response = await http.post(Uri.parse(urlCreateUser), body: {
        "nome": name,
        "email": email,
        "senha": password,
      });

      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

      if (response.statusCode == 201) {
        return Success(jsonResponse);
      }
      return Failure(jsonResponse);
    } catch (e) {
      return const Failure({"message": "Erro interno"});
    }
  }
}
