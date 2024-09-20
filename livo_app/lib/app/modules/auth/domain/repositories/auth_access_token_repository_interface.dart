import 'package:livo_app/app/modules/auth/domain/errors/auth_exception.dart';

abstract class AuthAccessTokenRepositoryInterface {
  Future<(AuthException? exception, void)> cacheToken(String token);
  Future<(AuthException? exception, String? token)> getToken();
  Future<(AuthException? exception, void)> clearToken();
}
