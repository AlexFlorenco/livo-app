import 'package:result_dart/result_dart.dart';

abstract class IHttpClient {
  AsyncResult<Map<String, dynamic>, Map<String, dynamic>> post(String url,
      {required Map<String, dynamic> body});
}
