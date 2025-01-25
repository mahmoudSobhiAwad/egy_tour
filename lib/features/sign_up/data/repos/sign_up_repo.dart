import 'package:egy_tour/features/auth/data/models/user_model.dart';

abstract class SignUpRepo {
  Future<void>signUp(User userModel);
}