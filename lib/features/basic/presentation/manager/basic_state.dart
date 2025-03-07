part of 'basic_cubit.dart';

@immutable
sealed class BasicState {}

final class BasicInitial extends BasicState {}

final class LoadingLogoutState extends BasicState {}

final class SuccessLogoutState extends BasicState {}

final class FailureLogoutState extends BasicState {
  final String? errMessage;

  FailureLogoutState({this.errMessage});
}

final class BaiscChangeBasicIndex extends BasicState {
  final int index;

  BaiscChangeBasicIndex({required this.index});
}
