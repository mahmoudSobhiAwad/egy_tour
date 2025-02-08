import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/functions/firestore_services.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';
import 'package:egy_tour/features/home/data/repos/home_repo_imp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // List<LandmarkModel> places = [];
  // Future<List<LandmarkModel>> getPlaces() async {
  //   places = await HomeRepoImp().getPlaces();
  //   return places;
  // }

  int index = 0;
  HomeBloc() : super(HomeInitial()) {
    on<ToggleItemIntoFavouriteEvent>(toggleItemIntoFavourite);
    on<ToggleItemOutOfFavouriteEvent>(toggleItemOutOfFavourite);
    on<LoadAllPlacesDataEvent>(loadPlaces);
  }

  Future<void> toggleItemIntoFavourite(
    ToggleItemIntoFavouriteEvent event,
    Emitter<HomeState> emit,
  ) async {
    final user =
        await FirestoreServices.getUser(FirebaseAuth.instance.currentUser!.uid);
    final result =
        await HomeRepoImp().addToFavorites(user, event.index, event.places);
    emit(ToggleFavoritedState());

    result.fold((status) async {
      emit(SuccessToggleState());
    }, (error) {
      emit(FailureToggleState());
    });
  }

  Future<void> toggleItemOutOfFavourite(
    ToggleItemOutOfFavouriteEvent event,
    Emitter<HomeState> emit,
  ) async {
    final user =
        await FirestoreServices.getUser(FirebaseAuth.instance.currentUser!.uid);

    emit(ToggleFavoritedState());
    final result = await HomeRepoImp()
        .removeFromFavorites(user, event.index, event.places);

    result.fold((status) async {
      emit(SuccessToggleState());
    }, (error) {
      emit(FailureToggleState());
    });
  }

  Future<Either<List<LandmarkModel>, String>> loadPlaces(
    LoadAllPlacesDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final user = await FirestoreServices.getUser(
          FirebaseAuth.instance.currentUser!.uid);
      event.places = await HomeRepoImp().getPlaces();
      emit(ComparingBetweenLoadingListState());

      for (var fav in user.favorites) {
        for (var place in event.places) {
          fav == place.uniqueId
              ? place.isFavorite = true
              : place.isFavorite = false;
        }
      }
      emit(LoadingListSuccessState());
      return left(event.places);
    } on FirebaseException catch (e) {
      emit(ComparingBetweenListFailureState());
      return right(e.toString());
    }
  }
}
