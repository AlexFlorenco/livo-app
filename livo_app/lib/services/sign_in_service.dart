// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../shared/constants/routes.dart';
// import 'http_error_messages.dart';

// class SignInService {
//   Future<ResultCodes> signIn(String email, String senha) async {
//     final dio = Dio();
//     const urlSignIn = Routes.urlSignIn;

//     try {
//       final response = await dio.post(
//         urlSignIn,
//         data: {
//           'email': email,
//           'senha': senha,
//         },
//       );

//       if (response.statusCode == 200) {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('access_token', response.data['access_token']);
//         prefs.remove('access_token');
//         return ResultCodes.success;
//       }
//     } on DioException catch (e) {
//       if (e.response?.statusCode == 401) {
//         return ResultCodes.incorrectData;
//       } else if (e.response?.statusCode == null) {
//         return ResultCodes.offlineServer;
//       }
//     }
//     return ResultCodes.unknownError;
//   }
// }
