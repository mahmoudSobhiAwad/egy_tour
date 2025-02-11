import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/auth/data/repo/auth_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_handleLoginRequested);
    on<SignUpRequested>(_handleSignUpRequested);
    on<ChangeObsecureTextEvent>(_changeObsecureText);
    on<ChangePickedCountryEvent>(_changePickedCountry);
  }

  AuthRepoImp authRepoImp = AuthRepoImp();

  Future<void> _handleLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepoImp.login(event.email, event.password);
    final UserModel user1 = await FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: event.email)
        .get()
        .then((value) {
      return UserModel.fromJson(value.docs[0], null);
    });

    result.fold((user) async {
      emit(AuthAuthenticated(user: user1));
    }, (error) {
      emit(AuthError(error));
    });
  }

  Future<void> _handleSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await authRepoImp.signUp(event.user);

    result.fold(
      (user) {
        emit(AuthAuthenticated(user: user));
      },
      (error) => emit(AuthError(error)),
    );
  }

  Future<void> _changeObsecureText(
    ChangeObsecureTextEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(ChangeObsecureTextState(status: !event.value));
  }

  Future<void> _changePickedCountry(
    ChangePickedCountryEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(ChangePickedCountryState(countryCode: event.country));
  }
}
