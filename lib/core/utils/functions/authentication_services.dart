import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices {
  AuthenticationServices._privateConstructor();
  static final auth = FirebaseAuth.instance;

  static Future<void> createUser({required UserModel user}) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: user.email.toString(),
        password: user.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('this email is already registered');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> login(
      {required String email, required String password}) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
