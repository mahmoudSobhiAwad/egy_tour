import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';

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

}
