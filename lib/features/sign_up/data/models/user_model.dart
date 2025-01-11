import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final String? phoneNumber;
  @HiveField(4)
  List<String> favorites;

  User({
    required this.userName,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.favorites = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'favorites': favorites,
    };
  }
}
