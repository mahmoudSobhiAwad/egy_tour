import 'package:dartz/dartz.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<User?, String>> login(User user);
  Future<Either<User?, String>> signUp(User user);
}
