part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class Favorited extends HomeState {}
final class UnFavorited extends HomeState {}
