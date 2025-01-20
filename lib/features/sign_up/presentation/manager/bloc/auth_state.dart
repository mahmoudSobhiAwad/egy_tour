part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  AuthAuthenticated({required this.user});
}

class AuthUnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
