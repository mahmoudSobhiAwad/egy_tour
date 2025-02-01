import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/functions/firestore_services.dart';
import 'package:egy_tour/core/utils/functions/shared_pref_helper.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';
import 'package:egy_tour/features/home/data/repos/home_repo.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeRepoImp implements HomeRepo {
  final id = FirebaseAuth.instance.currentUser!.uid;
  @override
  Future<Either<UserModel, String>> getUserModel() async {
    try {
      final user = await FirestoreServices.getUser(id);
      return left(user);
    } catch (e) {
      return right(e.toString());
    }
  }

  @override
  Future<Either<void, String>> logOut() async {
    try {
      await SharedPrefHelper.setString('');
      await FirebaseAuth.instance.signOut();
      return left(null);
    } on FirebaseException catch (e) {
      return right(e.toString());
    }
  }

  //gets all places from firestore database collection 'places'
  @override
  Future<List<LandmarkModel>> getPlaces() async {
    try {
      final places = await FirestoreServices.getPlaces();
      return places;
    } on FirebaseException catch (e) {
      return [];
    }
  }

  //adds a place to the favorites of a certain user and updates the user's document in the firestore database
  @override
  Future<Either<void, String>> addToFavorites(
      UserModel user, int index, List<LandmarkModel> places) async {
    try {
      user = await FirestoreServices.getUser(id);
      user.favorites.add(places[index].uniqueId);
      places[index].isFavorite = true;
      await FirestoreServices.updateUser(user);
      return left(null);
    } catch (e) {
      return right(e.toString());
    }
  }

  //removes a place from the favorites of a certain user and updates the user's document in the firestore database
  @override
  Future<Either<void, String>> removeFromFavorites(
      UserModel user, int index, List<LandmarkModel> places) async {
    try {
      user.favorites
          .removeWhere((element) => element == places[index].uniqueId);
      places[index].isFavorite = false;

      await FirestoreServices.updateUser(user);
      return left(null);
    } catch (e) {
      return right(e.toString());
    }
  }
}
