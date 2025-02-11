
import 'package:egy_tour/features/auth/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<UserModel> updateUser(UserModel updatedUser);
  Future<UserModel> getUser(String id);
}