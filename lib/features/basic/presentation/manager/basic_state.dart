part of 'basic_cubit.dart';

@immutable
sealed class BasicState {}

final class BasicInitial extends BasicState {}

class UsersLoading extends BasicState {
  final bool isLoading;

  UsersLoading(this.isLoading);
}

class UsersLoaded extends BasicState {
  final User? userModel;
  UsersLoaded(this.userModel);
}

class UsersError extends BasicState {
  final String error;
  UsersError(this.error);
}

class ScreenChanged extends BasicState {}
