import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/functions/hive_services.dart';
import 'package:egy_tour/core/utils/functions/shared_pref_helper.dart';
import 'package:egy_tour/features/auth/domain/repo/auth_repo.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImp implements AuthRepo {
  Service service = Service<UserModel>(boxName: userBox);
  @override
  Future<Either<UserModel, String>> login(UserModel user) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      await SharedPrefHelper.setString(credential.user?.email ?? "");

      return left(UserModel(
          email: credential.user?.email ?? "",
          password: credential.user?.email ?? ""));
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
      List<UserModel> usersList =
          await service.getAllPerson() as List<UserModel>;
      UserModel? loggedUser;
      for (var item in usersList) {
        if (item.email == user.email && item.password == user.password) {
          loggedUser = item;
          break;
        }
      }
      if (loggedUser == null) {
        await service.addPerson(user);
        return left(user);
      }
      return right("This email is created before !! ");
    } catch (e) {
      return right(e.toString());
    }
  }
}
