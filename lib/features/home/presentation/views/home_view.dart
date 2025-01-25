import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_places_card.dart';
import 'package:egy_tour/core/utils/widget/custom_snack_bar.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/home/presentation/manager/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:egy_tour/core/utils/constants/governments_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  final User user;

  const HomeView({super.key, required this.user});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(user: widget.user)..add(LoadAllPlacesDataEvent()),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is SuccessToggleState) {
            showCustomSnackBar(context, 'success Add to fav');
          } else if (state is FailureToggleState) {
            showCustomSnackBar(context, 'Error in Add To Fav',
                backgroundColor: AppColors.red);
          }
        },
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 33, right: 33),
                child: TabBar(
                  dividerColor: AppColors.black37,
                  dividerHeight: 1.5,
                  indicatorColor: AppColors.black37,
                  labelColor: AppColors.black37,
                  tabs: [
                    Tab(
                      child: Text(
                        "home.suggestedPlaces".tr(),
                        style: AppTextStyles.regular14,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "home.popularPlaces".tr(),
                        style: AppTextStyles.regular14,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (prev, curr) {
                  return curr is ToggleFavoritedState;
                },
                builder: (context, state) {
                  var cubit = context.read<HomeBloc>();
                  if (state is ComparingBetweenLoadingListState) {
                    return CircularProgressIndicator();
                  } else if (state is ComparingBetweenListFailureState) {
                    return Column(
                      children: [
                        Text(
                          "Error in Getting Date",
                          style: AppTextStyles.bold24,
                        ),
                      ],
                    );
                  }
                  return Expanded(
                    child: TabBarView(
                      children: [
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 145 / 190),
                          itemCount: suggestedLandmarksList.length,
                          itemBuilder: (context, index) {
                            return PlaceCard(
                              landmarkModel: suggestedLandmarksList[index],
                              toggle: (String id) {
                                cubit.add(
                                    ToggleItemInFavouriteEvent(itemId: id,isBasicDate: false));
                              },
                            );
                          },
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 250,
                              child: ListView.builder(
                                itemCount: popLandmarksList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return PlaceCard(
                                    landmarkModel: popLandmarksList[index],
                                    toggle: (String id) {
                                      cubit.add(ToggleItemInFavouriteEvent(
                                          itemId: id,));
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
