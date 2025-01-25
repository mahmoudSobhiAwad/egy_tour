import 'package:egy_tour/core/utils/constants/governments_list.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/favourites/data/repos/favourites_repo_imp.dart';
import 'package:egy_tour/features/home/data/repos/home_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final User user;
  HomeBloc({required this.user}) : super(HomeInitial()) {
    on<ToggleItemInFavouriteEvent>(toggleItemFavourite);
    on<LoadAllPlacesDataEvent>(loadPlaces);
  }

  Future<void> toggleItemFavourite(
      ToggleItemInFavouriteEvent event, Emitter<HomeState> emit) async {
    if (event.isBasicDate) {
      int index =
          popLandmarksList.indexWhere((item) => item.uniqueId == event.itemId);
      popLandmarksList[index].isFavorite = !popLandmarksList[index].isFavorite;
      if (popLandmarksList[index].isFavorite) {
        user.favorites.add(popLandmarksList[index].uniqueId);
      } else {
        user.favorites.remove(popLandmarksList[index].uniqueId);
      }
    } else {
      int index = suggestedLandmarksList
          .indexWhere((item) => item.uniqueId == event.itemId);
      suggestedLandmarksList[index].isFavorite =
          !suggestedLandmarksList[index].isFavorite;
      if (suggestedLandmarksList[index].isFavorite) {
        user.favorites.add(suggestedLandmarksList[index].uniqueId);
      } else {
        user.favorites.remove(suggestedLandmarksList[index].uniqueId);
      }
    }

    emit(ToggleFavoritedState());
    final result = await FavouritesRepoImp().toggleFavourite(user);
    result.fold((status) async {
      emit(SuccessToggleState());
    }, (error) {
      emit(FailureToggleState());
    });
  }

  Future<void> loadPlaces(
      LoadAllPlacesDataEvent event, Emitter<HomeState> emit) async {
    emit(ComparingBetweenLoadingListState());
    final result = await HomeRepoImp().getUserModel(user.email);
    result.fold((data) {
      user.favorites.clear();
      user.favorites.addAll(data.favorites);
      for (var item in popLandmarksList) {
        if (data.favorites.contains(item.uniqueId)) {
          item.isFavorite = true;
        }
      }
      for (var item in suggestedLandmarksList) {
        if (data.favorites.contains(item.uniqueId)) {
          item.isFavorite = true;
        }
      }
      emit(ComparingBetweenListState());
    }, (error) {
      emit(ComparingBetweenListFailureState());
    });
  }
}
