
import 'package:egy_tour/core/utils/functions/firestore_services.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImp implements ProfileRepo {
@override
  Future<UserModel> updateUser(UserModel updatedUser) async {
    await FirestoreServices.updateUser(updatedUser);
    return updatedUser;
  }

  @override
  Future<UserModel> getUser(String id) async {
    return await FirestoreServices.getUser(id);
  }

}