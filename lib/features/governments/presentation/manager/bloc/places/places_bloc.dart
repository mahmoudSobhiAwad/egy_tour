import 'package:egy_tour/features/governments/data/repos/govern_repo_imp.dart';
import 'package:egy_tour/features/governments/presentation/manager/bloc/places/places_event.dart';
import 'package:egy_tour/features/governments/presentation/manager/bloc/places/places_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final _placesRepo = GovernRepoImp();

  PlacesBloc(): super(PlacesInitial()) {
    on<LoadPlaces>((event, emit) {
      try {
        emit(PlacesLoading());
        final data = _placesRepo.getGovernemts();
        emit(PlacesLoaded(governments: data));
      } 
      catch(e) {
        emit(PlacesError(message: "Can not load Places!"));
      }
    });

    on<LoadMorePlaces>((event, emit) {
        try {
        emit(PlacesLoading());
        final data = _placesRepo.getMoreGovernemts();
        emit(PlacesLoaded(governments: data));
      } 
      catch(e) {
        emit(PlacesError(message: "Can not load Places!"));
      }
    });
  }
}