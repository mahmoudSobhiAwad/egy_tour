import 'package:egy_tour/features/sign_up/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:egy_tour/features/sign_up/data/repos/sign_up_repo_imp.dart';
import 'package:egy_tour/core/utils/functions/hive_services.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpRepoImp signUpRepo;
  final Service<User> _service = Service<User>(boxName: userBox);
  User? _currentUser;

  AuthBloc({required this.signUpRepo}) : super(AuthInitial()) {
    on<LoginRequested>(_handleLoginRequested);
    on<SignUpRequested>(_handleSignUpRequested);
    on<LogoutRequested>(_handleLogoutRequested);
  }

  Future<void> _handleLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());

      final users = await _service.getAllPerson();

      // Find user with matching credentials
      final user = users.firstWhere(
        (user) => user.email == event.email && user.password == event.password,
        orElse: () => throw Exception('Invalid credentials'),
      );

      // Store current user in memory
      _currentUser = user;

      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _handleSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());

      final result = await signUpRepo.signUp(event.user);

      result.fold(
        (user) {
          // Store current user in memory
          _currentUser = user;
          emit(AuthAuthenticated(user: user));
        },
        (error) => emit(AuthError(error)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _handleLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());

      // Clear current user
      _currentUser = null;

      emit(AuthUnAuthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Helper method to check if user is logged in
  bool isLoggedIn() {
    return _currentUser != null;
  }

  // Helper method to get current user
  User? getCurrentUser() {
    return _currentUser;
  }
}
