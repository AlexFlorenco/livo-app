import 'package:livo_app/app/modules/auth/domain/entities/auth_result.dart';
import 'package:livo_app/app/modules/auth/domain/errors/auth_exception.dart';

abstract class AuthWithEmailRepositoryInterface {
  Future<(AuthException? exception, AuthResult? authResponseModel)> signUp(
    String username,
    String email,
    String password,
  );

  Future<(AuthException? exception, AuthResult? authResponseModel)> signIn(
    String identifier,
    String password,
  );
}
