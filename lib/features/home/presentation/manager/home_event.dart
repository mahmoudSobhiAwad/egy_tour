part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FavoritedEvent extends HomeEvent {
  final bool isfavorited = true;
}

class UnFavoritedEvent extends HomeEvent {
  final bool isfavorited = false;
}
