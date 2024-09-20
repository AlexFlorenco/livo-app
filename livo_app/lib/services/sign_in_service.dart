// import 'package:result_dart/result_dart.dart';

// import '../../../core/routes/routes.dart';
// import '../interfaces/http_client_service.dart';
// import '../repositories/http_http_client.dart';

// class SignInService {
//   final IHttpClient _httpClient = HttpHttpClient();

//   AsyncResult<Map<String, dynamic>, Map<String, dynamic>> signIn(
//       String email, String senha) async {
//     const urlSignIn = Routes.urlSignIn;

//     try {
//       var response = await _httpClient.post(
//         urlSignIn,
//         body: {
//           'email': email,
//           'senha': senha,
//         },
//       );

//       return response.fold(
//         (success) => Success(success),
//         (failure) => Failure(failure),
//       );
//     } catch (e) {
//       return const Failure({"message": "Erro interno"});
//     }
//   }
// }
