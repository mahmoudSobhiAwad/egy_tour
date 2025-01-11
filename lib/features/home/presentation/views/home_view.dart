import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_places_card.dart';
import 'package:egy_tour/features/sign_up/data/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/governments_list.dart';

class HomeView extends StatefulWidget {
  final User? user;
  const HomeView({super.key, required this.user});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                    style: AppTextStyles.regular16,
                  ),
                ),
                Tab(
                  child: Text(
                    "home.popularPlaces".tr(),
                    style: AppTextStyles.regular16,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
              children: [
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 150 / 190),
                  itemCount: suggestedLandmarksList.length,
                  itemBuilder: (context, index) {
                    return PlaceCard(
                      landmarkModel: suggestedLandmarksList[index],
                      user: widget.user,
                    );
                  },
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        itemCount:popLandmarksList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return PlaceCard(
                            landmarkModel: popLandmarksList[index],
                            user: widget.user,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
