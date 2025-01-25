
import 'package:egy_tour/features/auth/data/models/user_model.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class ProfileUpdateLoading extends ProfileStates {}

class ProfileUpdateSuccess extends ProfileStates {
  final String message;
  final User updatedUser;
  ProfileUpdateSuccess(this.message, this.updatedUser);
}

class ProfileUpdateFailure extends ProfileStates {
  final String errMessage;
  ProfileUpdateFailure(this.errMessage);
}
