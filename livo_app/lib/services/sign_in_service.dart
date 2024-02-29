import 'package:dio/dio.dart';
import 'package:livo_app/shared/constants/routes.dart';

class SignInService {
  Future<void> signIn(String email, String senha) async {
    final dio = Dio();
    const url = Routes.urlSignIn;

    try {
      final response = await dio.post(
        url,
        data: {
          'email': email,
          'senha': senha,
        },
      );

      if (response.statusCode == 200) {
        print('Login bem sucedido');
      } else {
        print('Falha no login');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }
}
