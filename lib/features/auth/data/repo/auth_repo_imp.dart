import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/functions/firestore_services.dart';
import 'package:egy_tour/core/utils/functions/hive_services.dart';
import 'package:egy_tour/core/utils/functions/shared_pref_helper.dart';
import 'package:egy_tour/features/auth/domain/repo/auth_repo.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

class AuthRepoImp implements AuthRepo {
  Service service = Service<UserModel>(boxName: userBox);
  @override
  Future<Either<UserModel, String>> login(String email, String password) async {
    try {
      //login using firebase
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      await SharedPrefHelper.setString(credential.user?.email ?? "");
      //after login get user from firestore database collection with the corresponding id to display his data in the profile tab
      final user = await FirestoreServices.getUser(credential.user!.uid);
      return left(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return right('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return right('Wrong password provided for that user.');
      }
      return right(e.message ?? "");
    }
  }

  @override
  Future<Either<UserModel, String>> signUp(UserModel user) async {
    try {
      //create a new user using firebase
      final credential = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      //adds the new user to the firestore database collection 'users'
      await FirestoreServices.addUser(user, credential.user!.uid);
      await service.addPerson(user);
      return left(user);
    } on FirebaseAuthException catch (e) {
      return right(e.toString());
    }
  }
}
