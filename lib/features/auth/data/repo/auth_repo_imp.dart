import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/functions/hive_services.dart';
import 'package:egy_tour/core/utils/functions/shared_pref_helper.dart';
import 'package:egy_tour/features/auth/domain/repo/auth_repo.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';

class AuthRepoImp implements AuthRepo {
  Service service = Service<User>(boxName: userBox);
  @override
  Future<Either<User, String>> login(User user) async {
    try {
      List<User> usersList = await service.getAllPerson() as List<User>;
      User? loggedUser;
      for (var item in usersList) {
        if (item.email == user.email && item.password == user.password) {
          loggedUser = item;
          break;
        }
      }

      if (loggedUser != null) {
        await SharedPrefHelper.setString(loggedUser.email);
        return left(loggedUser);
      }
      return right("Password or Email is wrong");
    } catch (e) {
      return right("No Email Found");
    }
  }

  @override
  Future<Either<User, String>> signUp(User user) async {
    try {
      List<User> usersList = await service.getAllPerson() as List<User>;
      User? loggedUser;
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
