import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';
import 'dart:convert';

import '../interfaces/http_client_service.dart';

class HttpHttpClient implements IHttpClient {
  final http.Client _client = http.Client();

  @override
  AsyncResult<Map<String, dynamic>, Map<String, dynamic>> post(String url,
      {required Map<String, dynamic> body}) async {
    final response = await _client.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Success(jsonDecode(response.body));
    }
    return Failure(jsonDecode(response.body));
  }
}
