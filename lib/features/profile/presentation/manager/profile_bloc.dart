import 'dart:developer';

import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:egy_tour/features/profile/data/repos/profile_repo.dart';
import 'profile_events.dart';
import 'profile_states.dart';

class ProfileBloc extends Bloc<UpdateUserEvent, ProfileStates> {
  final ProfileRepo profileRepo;

  ProfileBloc(this.profileRepo) : super(ProfileInitial()) {
    on<UpdateUserEvent>((event, emit) async {
      await _updateUserData(event, emit);
    });
  }

  Future<void> _updateUserData(UpdateUserEvent event, Emitter<ProfileStates> emit) async {
    emit(ProfileUpdateLoading());
    try {
      final updatedUser = UserModel(
        id: event.id,
        userName: event.name,
        email: event.email,
        password: event.password,
        phoneNumber: event.phone,
        profileImage: event.profileImage,
      );

         if (updatedUser.id == null) {
        throw Exception("User ID is null! Cannot update.");
      }

      log('Updating user with ID: ${updatedUser.id}'); // Debug log
      
      final result = await profileRepo.updateUser(updatedUser);
      emit(ProfileUpdateSuccess('Profile updated successfully', result));
    } catch (e) {
      emit(ProfileUpdateFailure(e.toString()));
    }
  }
}
