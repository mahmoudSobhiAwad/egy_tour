import 'package:dartz/dartz.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';

abstract class FavouritesRepo {
  Future<Either<List<LandmarkModel>, String>> makeFavList();
  Future<Either<bool, String>> removeFromFavourite(UserModel user,int index);
}
