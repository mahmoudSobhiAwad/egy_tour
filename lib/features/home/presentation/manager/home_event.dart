part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ToggleItemIntoFavouriteEvent extends HomeEvent {
  final UserModel user;
  final int index;
  List<LandmarkModel> places;

  ToggleItemIntoFavouriteEvent({
    required this.user,
    required this.places,
    required this.index,
  });
}

class ToggleItemOutOfFavouriteEvent extends HomeEvent {
  final UserModel user;
  final int index;
  List<LandmarkModel> places;

  ToggleItemOutOfFavouriteEvent({
    required this.user,
    required this.places,
    required this.index,
  });
}

class LoadAllPlacesDataEvent extends HomeEvent {
  List<LandmarkModel> places;
  LoadAllPlacesDataEvent({required this.places});
}
