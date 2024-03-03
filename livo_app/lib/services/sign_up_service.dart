import 'package:dio/dio.dart';

import '../shared/constants/routes.dart';
import 'http_error_messages.dart';

class SignUpService {
  Future<ResultCodes> signUp(String nome, String email, String senha) async {
    final dio = Dio();
    const urlSignUp = Routes.urlSignUp;

    try {
      final response = await dio.post(
        urlSignUp,
        data: {
          'nome': nome,
          'email': email,
          'senha': senha,
        },
      );

      if (response.statusCode == 201) {
        return ResultCodes.success;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        return ResultCodes.emailAlredyExists;
      } else if (e.response?.statusCode == null) {
        return ResultCodes.offlineServer;
      }
    }
    return ResultCodes.unknownError;
  }
}
