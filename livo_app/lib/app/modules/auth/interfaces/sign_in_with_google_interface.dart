import '../models/user_model.dart';

abstract class ISignInWithGoogle {
  Future<UserModel?> signIn();
}
