import 'package:dartz/dartz.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';

abstract class HomeRepo {
  Future<Either<User?, String>> getUserModel(String email);
  Future<void> logOut();
}
