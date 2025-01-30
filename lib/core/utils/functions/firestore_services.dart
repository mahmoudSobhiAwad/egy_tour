import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';

class FirestoreServices {
  FirestoreServices._privateConstructor();
  static final _firestore = FirebaseFirestore.instance;
  //create user
  static Future<UserModel> addUser(UserModel user) async {
    //when adding a new user
    await _firestore.collection('users').doc(user.id).set(user.toJson());
    return user;
  }

  //fetch user
  static Future<UserModel> getUser(String id) async {
    final retrievedUser = await _firestore.collection('users').doc(id).get();
    final user = UserModel.fromJson(retrievedUser, null);
    return user;
  }

  //update user
  static Future<void> updateUser(UserModel user) async {
    await _firestore.collection('users').doc(user.id).update(user.toJson());
  }

  static Future<List<LandmarkModel>> getPlaces(places) async {
    await _firestore.collection('places').get().then((value) {
      for (var doc in value.docs) {
        final note = places.fromMap(doc.data());
        places.add(note);
      }
    });
    return places;
  }
}
