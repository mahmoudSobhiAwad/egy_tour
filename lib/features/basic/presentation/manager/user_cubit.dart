import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> fetchUserData() async {
    emit(UserLoading());
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        UserModel user = UserModel.fromJson(
            userDoc as DocumentSnapshot<Map<String, dynamic>>, null);
        log("User Profile Image in Basic: ${user.profileImage}");
        emit(UserLoaded(user));
      } else {
        emit(UserError("User not found"));
      }
    } catch (e) {
      emit(UserError("Failed to load user data: $e"));
    }
  }
}
