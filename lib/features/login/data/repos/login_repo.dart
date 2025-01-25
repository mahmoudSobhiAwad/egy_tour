import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<User?, String>>checkLogin(User user);
}
