import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/functions/hive_services.dart';
import 'package:egy_tour/core/utils/functions/shared_pref_helper.dart';
import 'package:egy_tour/features/home/data/repos/home_repo.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';

class HomeRepoImp implements HomeRepo {
  Service service = Service<UserModel>(boxName: userBox);
  @override
  Future<Either<UserModel, String>> getUserModel(String email) async {
    try {
      List<UserModel> usersList = await service.getAllPerson() as List<UserModel>;

      bool isUserExist =
          usersList.where((model) => model.email == email).isNotEmpty;
      if (isUserExist) {
        return left(usersList.first);
      }
      return right('Error');
    } catch (e) {
      return right(e.toString());
    }
  }

  @override
  Future<void> logOut() async {
    await SharedPrefHelper.setString('');
  }
}
