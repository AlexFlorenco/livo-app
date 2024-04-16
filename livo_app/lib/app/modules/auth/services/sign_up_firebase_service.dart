import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../interfaces/sign_up_with_google_interface.dart';
import '../models/user_model.dart';

class FirebaseSignUpService implements ISignUpWithGoogle {
  @override
  Future<UserModel?> signUp() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await auth.signInWithCredential(credential);

        UserModel user = UserModel(
          id: googleSignInAccount.id,
          name: googleSignInAccount.displayName!,
          email: googleSignInAccount.email,
          photoUrl: googleSignInAccount.photoUrl!,
        );
        return user;
      }
    } catch (e) {
      print('error');
    }
    return null;
  }
}
