part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class SuccessGetFavouriteList extends FavouriteState {}

final class FailureGetFavouriteList extends FavouriteState {}

final class ToggleSuccessState extends FavouriteState {}

final class ToggleFailureState extends FavouriteState {
  final String?errMessage;

  ToggleFailureState({this.errMessage});

}
