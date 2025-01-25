import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'basic_state.dart';

class BasicCubit extends Cubit<BasicState> {
  BasicCubit() : super(BasicInitial());
  int basicIndex = 0;
  void changeScreen(int index) {
    emit(BaiscChangeBasicIndex(index: index));
  }
}
