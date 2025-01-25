import 'package:egy_tour/features/sign_up/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<User> updateUser(String email, User updatedUser);
}