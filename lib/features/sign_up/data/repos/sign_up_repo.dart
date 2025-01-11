import 'package:egy_tour/features/sign_up/data/models/user_model.dart';

abstract class SignUpRepo {
  Future<void>signUp(User userModel);
}