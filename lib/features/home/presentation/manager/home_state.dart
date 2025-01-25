part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ComparingBetweenLoadingListState extends HomeState {}

final class ToggleFavoritedState extends HomeState {}

final class ComparingBetweenListState extends HomeState {}

final class ComparingBetweenListFailureState extends HomeState {}

final class SuccessToggleState extends HomeState {}

final class FailureToggleState extends HomeState {}
