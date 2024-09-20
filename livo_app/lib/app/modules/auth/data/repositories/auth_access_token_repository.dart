import 'package:livo_app/app/modules/auth/data/services/auth_access_token_service.dart';
import 'package:livo_app/app/modules/auth/domain/errors/auth_exception.dart';
import 'package:livo_app/app/modules/auth/domain/repositories/auth_access_token_repository_interface.dart';

class AuthAccessTokenRepository implements AuthAccessTokenRepositoryInterface {
  final AuthAccessTokenServiceInterface authAccessTokenService;

  AuthAccessTokenRepository({required this.authAccessTokenService});

  @override
  Future<(AuthException?, String?)> getToken() async {
    try {
      final token = await authAccessTokenService.getToken();
      return (null, token);
    } catch (e) {
      return (AuthException(e.toString()), null);
    }
  }

  @override
  Future<(AuthException?, void)> cacheToken(String token) async {
    try {
      await authAccessTokenService.cacheToken(token);
      return (null, null);
    } catch (e) {
      return (AuthException(e.toString()), null);
    }
  }

  @override
  Future<(AuthException?, void)> clearToken() async {
    try {
      await authAccessTokenService.clearToken();
      return (null, null);
    } catch (e) {
      return (AuthException(e.toString()), null);
    }
  }
}
