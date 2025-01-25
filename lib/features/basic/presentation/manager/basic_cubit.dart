import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:egy_tour/features/home/data/repos/home_repo_imp.dart';
import 'package:egy_tour/features/sign_up/data/models/user_model.dart';

part 'basic_state.dart';

class BasicCubit extends Cubit<BasicState> {
  BasicCubit() : super(BasicInitial());
  int selectedIndex = 0;
  bool isLoading = true;
  final HomeRepoImp homeRepoImp = HomeRepoImp();
  User? userModel;

  Future<void> getUserModel(String email) async {
    emit(UsersLoading(true));
    final result = await homeRepoImp.getUserModel(email);
    result.fold((user) {
      // userModel = user;

      emit(UsersLoaded(user));
    }, (error) {
      emit(UsersError(error));
    });
    emit(UsersLoading(false));
  }

  void changeScreen() {
    emit(ScreenChanged());
  }
}
