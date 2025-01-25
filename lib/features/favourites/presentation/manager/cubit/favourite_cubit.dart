import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/favourites/data/repos/favourites_repo_imp.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final User user;
  FavouriteCubit({required this.user}) : super(FavouriteInitial());
  List<LandmarkModel> favoriteList = [];
  
  Future<void> loadFavList() async {
    final result = await FavouritesRepoImp().makeFavList(user.favorites);
    result.fold((list) {
      favoriteList.addAll(list);
      emit(SuccessGetFavouriteList());
    }, (error) {
      emit(FailureGetFavouriteList());
    });
  }

  Future<void> toggleBetweenFavourite(int index, String id) async {
    favoriteList[index].isFavorite = !favoriteList[index].isFavorite;
    if (favoriteList[index].isFavorite) {
      user.favorites.add(id);
    } else {
      user.favorites.remove(id);
    }

    final result = await FavouritesRepoImp().toggleFavourite(user);
    result.fold((status) {
      emit(ToggleSuccessState());
    }, (error) {
      emit(ToggleFailureState(errMessage: error));
    });
  }
}