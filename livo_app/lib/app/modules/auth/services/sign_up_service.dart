import 'package:result_dart/result_dart.dart';

import '../../../core/routes/routes.dart';
import '../interfaces/http_client_service.dart';
import '../repositories/http_http_client.dart';

class SignUpService {
  final IHttpClient _httpClient = HttpHttpClient();

  AsyncResult<Map<String, dynamic>, Map<String, dynamic>> signUp(
      String nome, String email, String senha) async {
    const urlSignUp = Routes.urlSignUp;
    try {
      var response = await _httpClient.post(
        urlSignUp,
        body: {
          'nome': nome,
          'email': email,
          'senha': senha,
        },
      );

      return response.fold(
        (success) => Success(success),
        (failure) => Failure(failure),
      );
    } catch (e) {
      return const Failure({"message": "Erro interno"});
    }
  }
}
