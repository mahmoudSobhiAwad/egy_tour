import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String? userName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final String? phoneNumber;
  @HiveField(5)
  List<String> favorites;
  final String? profileImage; // Add this

  UserModel({
    this.id,
    this.userName,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.favorites = const [],
    this.profileImage, 
  });
  //converts userModel to Json when sending data to firestore
  Map<String, dynamic> toJson() {
    return {
      'id': FirebaseAuth.instance.currentUser!.uid,
      'userName': userName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'favorites': favorites,
      'profileImage': profileImage
    };
  }
  //converts data from Json to userModel when getting data from firestore
  factory UserModel.fromJson(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? snapShotOptions,
  ) {
    List<String> fav = [];
    for (var element in snapshot.data()!['favorites']) {
      fav.add(element);
    }
    final data = snapshot.data();
    return UserModel(
      id: data?['id'],
      email: data?['email'],
      userName: data?['userName'],
      password: data?['password'],
      phoneNumber: data?['phoneNumber'],
      profileImage: data?['profileImage'],
      favorites: fav,
    );
  }
}
