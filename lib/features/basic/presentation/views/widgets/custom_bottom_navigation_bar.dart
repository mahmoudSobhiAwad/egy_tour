import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/constant_variables.dart';
import '../../../../../core/utils/theme/app_colors.dart';

Widget customBottomNavigationBar(
    {required BuildContext context,
    required Function({int currentIndex}) changeScreen,
    required int selectedIndex}) {
  return Container(
    margin: EdgeInsets.only(
      left: 22.5,
      right: 22.5,
      bottom: 20,
    ),
    width: context.screenWidth * 0.88,
    height: context.screenHeight * 0.071,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      gradient: LinearGradient(colors: [
        AppColors.blueLight,
        AppColors.purple,
      ]),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: unSelectedIcons.map((icon) {
        int currentIndex = unSelectedIcons.indexOf(icon);
        bool isSelected = selectedIndex == currentIndex;
        return Expanded(
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                changeScreen(currentIndex: currentIndex);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    isSelected
                        ? selectedIcons[currentIndex]
                        : unSelectedIcons[currentIndex],
                    size: 25,
                    color: AppColors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 2,
                    ),
                    height: 5,
                    width: 36,
                    decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.white
                            : AppColors.white.withAlpha(0),
                        borderRadius: BorderRadius.circular(4)),
                  )
                ],
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
