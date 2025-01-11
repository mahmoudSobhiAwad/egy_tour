import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/constants/governments_list.dart';
import 'package:egy_tour/features/favourites/data/repos/favourites_repo.dart';

import '../../../governments/data/models/land_mark_model.dart';

class FavouritesRepoImp implements FavouritesRepo {
  @override
  Future<Either<List<LandmarkModel>?, String>> makeFavList(
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
}
