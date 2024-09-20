import 'package:livo_app/app/modules/auth/domain/entities/user.dart';

class AuthResult {
  final String accessToken;
  final User user;

  AuthResult({
    required this.accessToken,
    required this.user,
  });
}
