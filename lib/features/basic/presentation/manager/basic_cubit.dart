import 'package:egy_tour/features/home/data/repos/home_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'basic_state.dart';

class BasicCubit extends Cubit<BasicState> {
  BasicCubit() : super(BasicInitial());
  int basicIndex = 0;
  void changeScreen(int index) {
    emit(BaiscChangeBasicIndex(index: index));
  }

  Future<void> logOut() async {
    emit(LoadingLogoutState());
    final result = await HomeRepoImp().logOut();
    result.fold((success) {
      emit(SuccessLogoutState());
    }, (error) {
      emit(FailureLogoutState(errMessage: error));
    });
  }
}
