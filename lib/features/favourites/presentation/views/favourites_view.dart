import 'package:egy_tour/core/utils/widget/custom_places_card.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/favourites/presentation/manager/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesView extends StatelessWidget {
  final User user;
  const FavouritesView({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteCubit(user: user)..loadFavList(),
      child: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          var cubit = context.read<FavouriteCubit>();
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 150 / 190,
              ),
              itemCount: cubit.favoriteList.length,
              itemBuilder: (context, index) {
                return PlaceCard(
                  landmarkModel: cubit.favoriteList[index],
                  toggle: (String id) {
                    cubit.toggleBetweenFavourite(index,id);
                  },
                );
              });
        },
      ),
    );
  }
}
