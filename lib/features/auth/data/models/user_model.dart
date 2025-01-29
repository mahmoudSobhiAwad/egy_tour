import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String? id;
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

  UserModel({
    this.id,
    this.userName,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.favorites = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id':FirebaseAuth.instance.currentUser!.uid,
      'userName': userName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'favorites': favorites,
    };
  }

  factory UserModel.fromJson(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? snapShotOptions,
  ) {
    final data = snapshot.data();
    return UserModel(
      id: data?['id'],
      email: data?['email'],
      userName: data?['userName'],
      password: data?['password'],
      phoneNumber: data?['phoneNumber'],
      favorites: data?['favorites'],
    );
  }
}
