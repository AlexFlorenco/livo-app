import 'package:livo_app/app/modules/auth/domain/entities/auth_result.dart';
import 'package:livo_app/app/modules/auth/data/models/user_model.dart';

class AuthResultModel extends AuthResult {
  AuthResultModel({
    required super.accessToken,
    required UserModel super.user,
  });

  factory AuthResultModel.fromJson(Map<String, dynamic> json) {
    return AuthResultModel(
      accessToken: json['jwt'],
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jwt': accessToken,
      'user': (user as UserModel).toJson(),
    };
  }
}
