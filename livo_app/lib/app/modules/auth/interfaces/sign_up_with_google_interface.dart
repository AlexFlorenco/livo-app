import '../models/user_model.dart';

abstract class ISignUpWithGoogle {
  Future<UserModel?> signUp();
}
