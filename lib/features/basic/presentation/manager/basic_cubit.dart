import 'package:egy_tour/core/utils/functions/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'basic_state.dart';

class BasicCubit extends Cubit<BasicState> {
  BasicCubit() : super(BasicInitial());
  int basicIndex = 0;
  void changeScreen(int index) {
    emit(BaiscChangeBasicIndex(index: index));
  }

  void logOut() async{
  await  SharedPrefHelper.setString('');
  emit(SuccessLogoutState());
  }
}
