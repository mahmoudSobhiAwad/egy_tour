import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/functions/hive_services.dart';
import 'package:egy_tour/core/utils/functions/shared_pref_helper.dart';
import 'package:egy_tour/features/home/data/repos/home_repo.dart';
import 'package:egy_tour/features/sign_up/data/models/user_model.dart';

class HomeRepoImp implements HomeRepo {
  Service service = Service<User>(boxName: userBox);
  @override
  Future<Either<User?, String>> getUserModel(String email) async {
    try {
      List<User> usersList = await service.getAllPerson() as List<User>;

      bool isUserExist =
          usersList.where((model) => model.email == email).isNotEmpty;

      return left(isUserExist ? usersList.first : null);
    } catch (e) {
      return right(e.toString());
    }
  }

  @override
  Future<void> logOut() async{
    await SharedPrefHelper.setString('');
  }
}
