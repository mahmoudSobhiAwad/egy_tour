part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

class SignUpRequested extends AuthEvent {
  final User user;
  SignUpRequested({required this.user});
}

class LogoutRequested extends AuthEvent {}

class ChangeObsecureTextEvent extends AuthEvent {
  final bool value;
  ChangeObsecureTextEvent({required this.value});
}

class ChangePickedCountryEvent extends AuthEvent {
  final CountryCode country;

  ChangePickedCountryEvent({required this.country});
}
