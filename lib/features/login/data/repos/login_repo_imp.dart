import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/functions/hive_services.dart';
import 'package:egy_tour/core/utils/functions/shared_pref_helper.dart';
import 'package:egy_tour/features/login/data/repos/login_repo.dart';
import 'package:egy_tour/features/sign_up/data/models/user_model.dart';

class LoginRepoImp implements LoginRepo {
  Service service = Service<User>(boxName: userBox);
  @override
  Future<Either<User?, String>> checkLogin(User user) async {
    try {
      List<User> usersList = await service.getAllPerson() as List<User>;

      List<User> checkingList = usersList
          .where(
            (item) =>
                item.email == user.email && item.password == user.password,
          )
          .toList();
      if (checkingList.isNotEmpty) {
        await SharedPrefHelper.setString(user.email);
      }
      return left(checkingList.isNotEmpty ? usersList.first : null);
    } catch (e) {
      return right(
        e.toString(),
      );
    }
  }
}
