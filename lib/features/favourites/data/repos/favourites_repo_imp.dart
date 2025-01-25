import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/constants/governments_list.dart';
import 'package:egy_tour/core/utils/functions/hive_services.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/favourites/data/repos/favourites_repo.dart';

import '../../../governments/data/models/land_mark_model.dart';

class FavouritesRepoImp implements FavouritesRepo {
  Service service = Service<User>(boxName: userBox);

  @override
  Future<Either<List<LandmarkModel>, String>> makeFavList(
      List<String> ids) async {
    List<LandmarkModel> faveList = [];
    try {
      for (var gov in governmentsList) {
        for (var landmark in gov.landMarkList) {
          if (ids.contains(landmark.uniqueId)) {
            landmark.isFavorite = true;
            faveList.add(landmark);
          } else {
            continue;
          }
        }
      }
      return Left(faveList);
    } on Exception catch (e) {
      return Right(e.toString());
    }
  }

  @override
  Future<Either<bool, String>> toggleFavourite(User user) async {
    try {
      final List<User> users =await service.getAllPerson() as List<User>;
      int index = users.indexWhere((item) => item.email == user.email);
      await service.updateFavList(index, user);

      return left(true);
    } catch (e) {
      print(e);
      return right(e.toString());
    }
  }
}
