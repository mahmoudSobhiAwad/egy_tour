import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/functions/hive_services.dart';
import 'package:egy_tour/features/home/data/repos/home_repo.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';

class HomeRepoImp implements HomeRepo {
  Service service = Service<User>(boxName: userBox);
  @override
  Future<Either<User, String>> getUserModel(String email) async {
    try {
      List<User> usersList = await service.getAllPerson() as List<User>;

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

  
}
