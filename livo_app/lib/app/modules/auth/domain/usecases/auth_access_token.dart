import 'package:livo_app/app/modules/auth/domain/errors/auth_exception.dart';
import 'package:livo_app/app/modules/auth/domain/repositories/auth_access_token_repository_interface.dart';

abstract class AuthAccessTokenInterface {
  Future<(AuthException? exception, void)> cacheToken(String token);
  Future<(AuthException? exception, String? token)> getToken();
  Future<(AuthException? exception, void)> clearToken();
}

class AuthAccessToken implements AuthAccessTokenInterface {
  final AuthAccessTokenRepositoryInterface authAccessTokenRepository;

  AuthAccessToken({required this.authAccessTokenRepository});

  @override
  Future<(AuthException?, void)> cacheToken(String token) {
    return authAccessTokenRepository.cacheToken(token);
  }

  @override
  Future<(AuthException?, void)> clearToken() {
    return authAccessTokenRepository.clearToken();
  }

  @override
  Future<(AuthException?, String?)> getToken() {
    return authAccessTokenRepository.getToken();
  }
}
