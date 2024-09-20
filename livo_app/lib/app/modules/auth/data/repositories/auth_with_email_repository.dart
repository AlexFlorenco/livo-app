import 'package:livo_app/app/modules/auth/data/services/auth_with_email_service.dart';
import 'package:livo_app/app/modules/auth/domain/entities/auth_result.dart';
import 'package:livo_app/app/modules/auth/domain/errors/auth_exception.dart';
import 'package:livo_app/app/modules/auth/domain/repositories/auth_with_email_repository_interface.dart';

class AuthWithEmailRepository implements AuthWithEmailRepositoryInterface {
  final AuthWithEmailServiceInterface authWithEmailService;

  AuthWithEmailRepository({required this.authWithEmailService});

  @override
  Future<(AuthException?, AuthResult?)> signUp(
    String username,
    String email,
    String password,
  ) async {
    try {
      AuthResult result = await authWithEmailService.signUp(username, email, password);
      return (null, result);
    } catch (e) {
      return (AuthException(e.toString()), null);
    }
  }

  @override
  Future<(AuthException?, AuthResult?)> signIn(
    String identifier,
    String password,
  ) async {
    try {
      AuthResult result = await authWithEmailService.signIn(identifier, password);
      return (null, result);
    } catch (e) {
      return (AuthException(e.toString()), null);
    }
  }
}
