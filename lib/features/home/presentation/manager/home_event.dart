part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ToggleItemInFavouriteEvent extends HomeEvent {
  final String itemId;
  final bool isBasicDate;

  ToggleItemInFavouriteEvent({required this.itemId, this.isBasicDate = true});
}

class LoadAllPlacesDataEvent extends HomeEvent {}
