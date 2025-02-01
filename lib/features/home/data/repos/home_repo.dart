import 'package:dartz/dartz.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';

abstract class HomeRepo {
  Future<Either<UserModel?, String>> getUserModel();

  Future<void> logOut();

  Future<List<LandmarkModel>> getPlaces();
  Future<void> addToFavorites(
      UserModel user, int index, List<LandmarkModel> places);
  Future<void> removeFromFavorites(
      UserModel user, int index, List<LandmarkModel> places);
}
