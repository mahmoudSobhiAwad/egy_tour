import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    log('close  ${bloc.toString()}');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('create  ${bloc.toString()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('Error in ${bloc.runtimeType}: $error');
    log('Stack trace: $stackTrace');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('Event added to ${bloc.runtimeType}: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}