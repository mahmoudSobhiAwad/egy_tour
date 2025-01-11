import 'package:dartz/dartz.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';

abstract class FavouritesRepo {
  Future<Either<List<LandmarkModel>?, String>> makeFavList(List<String> ids);
}
