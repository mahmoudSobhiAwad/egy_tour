import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/functions/hive_services.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImp implements ProfileRepo {
  final Service<User> _hiveService = Service<User>(boxName: userBox);

  @override
  Future<User> updateUser(String email, User updatedUser) async {
    try {
      final users = await _hiveService.getAllPerson();
      if (users.isEmpty) {
        throw Exception('No users found');
      }

      final index = users.indexWhere((user) => user.email == email);
      if (index == -1) {
        throw Exception('User not found');
      }

      final userToUpdate = User(
        userName: updatedUser.userName,
        email: updatedUser.email,
        password: updatedUser.password,
        phoneNumber: updatedUser.phoneNumber,
        favorites: users[index].favorites,
      );

      await _hiveService.updateDeck(index, userToUpdate);
      
      // Verify the update was successful
      final updatedUsers = await _hiveService.getAllPerson();
      final updatedUserFromHive = updatedUsers[index];
      
      return updatedUserFromHive;

    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }
}