import 'package:egy_tour/core/utils/widget/custom_places_card.dart';
import 'package:egy_tour/features/favourites/data/repos/favourites_repo_imp.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';
import 'package:flutter/material.dart';

import '../../../sign_up/data/models/user_model.dart';

class FavouritesView extends StatefulWidget {
  final User? user;
  const FavouritesView({super.key, required this.user});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  final FavouritesRepoImp favouritesRepoImp = FavouritesRepoImp();
  List<LandmarkModel>? favoriteList = [];
  @override
  void initState() {
    super.initState();
    makeFavList();
  }

  Future<void> makeFavList() async {
    final result = await favouritesRepoImp.makeFavList(widget.user!.favorites);
    result.fold((favList) {
      favoriteList = favList;
      setState(() {});
    }, (error) {
      return error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 150 / 190,
        ),
        itemCount: favoriteList?.length,
        itemBuilder: (context, index) {
          return PlaceCard(
            user: widget.user,
            landmarkModel: favoriteList![index],
          );
        });
  }
}
