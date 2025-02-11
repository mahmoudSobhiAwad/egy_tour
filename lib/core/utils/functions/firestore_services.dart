import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {
  FirestoreServices._privateConstructor();
  static final firestore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;


  static Future<String> getUserId() async {
    return auth.currentUser!.uid;
  }
  //create user in firestore
  static Future<UserModel> addUser(UserModel user, String id) async {
    user.id = id;
    await firestore.collection('users').doc(id).set(user.toJson());
    return user;
  }

  //get user
  static Future<UserModel> getUser(String id) async {
    final retrievedUser = await firestore.collection('users').doc(id).get();
    final user = UserModel.fromJson(retrievedUser, null);
    return user;
  }

  //update user
   static Future<void> updateUser(UserModel user) async {
    if (user.id == null) {
      throw Exception("User ID is null! Cannot update.");
    }

    await firestore.collection('users').doc(user.id).set(
          user.toJson(),
          SetOptions(merge: true), // Merges data instead of failing if missing
        );
  }

//get all places from the firestore collection
  static Future<List<LandmarkModel>> getPlaces() async {
    List<LandmarkModel> places = [];
    await firestore.collection('places').get().then((value) {
      for (var doc in value.docs) {
        final place = LandmarkModel.fromFirestore(doc, null);
        places.add(place);
      }
    });
    return places;
  }
}
