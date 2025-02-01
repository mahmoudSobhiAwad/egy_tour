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
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      await SharedPrefHelper.setString(credential.user?.email ?? "");
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
      final credential = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      await FirestoreServices.addUser(user, credential.user!.uid);
      await service.addPerson(user);
      return left(user);

      // List<UserModel> usersList =
      //     await service.getAllPerson() as List<UserModel>;
      // UserModel? loggedUser;
      // for (var item in usersList) {
      //   if (item.email == user.email && item.password == user.password) {
      //     loggedUser = item;
      //     break;
      //   }
      // }
      // if (loggedUser == null) {
      //   await service.addPerson(user);
      //   return left(user);
      // }
      // return right("This email is created before !! ");
    } on FirebaseAuthException catch (e) {
      return right(e.toString());
    }
  }
}
