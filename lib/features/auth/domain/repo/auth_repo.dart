import 'package:dartz/dartz.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<UserModel?, String>> login(String email, String password);
  Future<Either<UserModel?, String>> signUp(UserModel user);
}
