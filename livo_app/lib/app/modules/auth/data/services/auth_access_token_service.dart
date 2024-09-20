import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthAccessTokenServiceInterface {
  Future<void> cacheToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

class AuthAccessTokenService implements AuthAccessTokenServiceInterface {
  final FlutterSecureStorage secureStorage;

  AuthAccessTokenService({required this.secureStorage});

  @override
  Future<void> cacheToken(String token) async {
    await secureStorage.write(key: 'ACCESS_TOKEN', value: token);
  }

  @override
  Future<String?> getToken() async {
    return await secureStorage.read(key: 'ACCESS_TOKEN');
  }

  @override
  Future<void> clearToken() async {
    await secureStorage.delete(key: 'ACCESS_TOKEN');
  }
}