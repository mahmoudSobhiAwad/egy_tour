import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';
import 'package:flutter/material.dart';

class LandmarkCard extends StatelessWidget {
  const LandmarkCard({
    super.key,
    required this.landmarkModel,
    required this.governName,
  });
  final LandmarkModel landmarkModel;
  final String governName;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.screenWidth * 0.05),
      ),
      child: InkWell(
        splashColor: AppColors.lightGrey1,
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                landmarkModel.imageUrl,
                height: context.screenHeight * 0.25,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(context.screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(landmarkModel.title,
                        style: AppTextStyles.bold18
                            .copyWith(color: AppColors.black37)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_pin, color: AppColors.grey21),
                        SizedBox(width: 5),
                        Text(governName,
                            style: AppTextStyles.regular16
                                .copyWith(color: AppColors.darkGrey)),
                        SizedBox(width: context.screenWidth * 0.3),
                        Icon(Icons.favorite_outline, size: 32),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
