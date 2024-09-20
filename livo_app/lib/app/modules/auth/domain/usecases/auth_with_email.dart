import 'package:livo_app/app/modules/auth/domain/entities/auth_result.dart';
import 'package:livo_app/app/modules/auth/domain/errors/auth_exception.dart';
import 'package:livo_app/app/modules/auth/domain/repositories/auth_with_email_repository_interface.dart';

abstract class AuthWithEmailInterface {
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

class AuthWithEmail implements AuthWithEmailInterface {
  final AuthWithEmailRepositoryInterface authWithEmailRepository;
  AuthWithEmail({required this.authWithEmailRepository});

  @override
  Future<(AuthException?, AuthResult?)> signUp(
    String username,
    String email,
    String password,
  ) {
    return authWithEmailRepository.signUp(username, email, password);
  }

  @override
  Future<(AuthException?, AuthResult?)> signIn(
    String identifier,
    String password,
  ) async {
    return authWithEmailRepository.signIn(identifier, password);
  }
}
