import 'package:egy_tour/features/governments/data/models/government_model.dart';

abstract class PlacesState {}

class PlacesInitial extends PlacesState {}

class PlacesLoading extends PlacesState {}

class PlacesLoaded extends PlacesState {
  final List<GovernmentModel> governments;

  PlacesLoaded({required this.governments});
}

class PlacesUpdated extends PlacesState {
  final List<GovernmentModel> governments;

  PlacesUpdated({required this.governments});
}

class PlacesError extends PlacesState {
  final String message;

  PlacesError({required this.message});
}