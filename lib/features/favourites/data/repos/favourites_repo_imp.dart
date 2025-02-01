import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/functions/firestore_services.dart';
import 'package:egy_tour/core/utils/functions/hive_services.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/auth/data/repo/auth_repo_imp.dart';
import 'package:egy_tour/features/favourites/data/repos/favourites_repo.dart';

import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';

class FavouritesRepoImp implements FavouritesRepo {
  Service service = Service<UserModel>(boxName: userBox);
  //gets all favorite places from the users favorites list
  @override
  Future<Either<List<LandmarkModel>, String>> makeFavList() async {
    List<LandmarkModel> faveList = [];
    try {
      final user = await FirestoreServices.getUser(auth.currentUser!.uid);
      for (var favorite in user.favorites) {
        await FirestoreServices.firestore
            .collection('places')
            .doc(favorite)
            .get()
            .then((value) {
          final place = LandmarkModel.fromFirestore(value, null);
          faveList.add(place);
          place.isFavorite = true;
        });
      }
      return Left(faveList);
    } on Exception catch (e) {
      return Right(e.toString());
    }
  }
  //removes a place from users favorite places and updates the user's document in the firestore database
  @override
  Future<Either<bool, String>> removeFromFavourite(
      UserModel user, int index) async {
    user.favorites.removeAt(index);

    try {
      await FirestoreServices.updateUser(user);
      return left(false);
    } on FirebaseException catch (e) {
      return right(e.toString());
    }
  }
}
