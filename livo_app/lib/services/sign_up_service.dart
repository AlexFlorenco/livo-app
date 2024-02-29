import 'package:dio/dio.dart';
import 'package:livo_app/shared/constants/routes.dart';

class SignUpService {
  Future<void> signUp(String nome, String email, String senha) async {
    final dio = Dio();
    const url = Routes.urlSignUp;

    try {
      final response = await dio.post(
        url,
        data: {
          'nome': nome,
          'email': email,
          'senha': senha,
        },
      );

      if (response.statusCode == 201) {
        print('Cadastro bem sucedido');
        print('ID: ${response.data['id']}');
      } else {
        print('Falha no cadastro');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }
}
