import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/extensions/navigation.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/features/governments/data/models/government_model.dart';
import 'package:egy_tour/features/governments/presentation/manager/bloc/places/places_bloc.dart';
import 'package:egy_tour/features/governments/presentation/views/lanmarks_view.dart';
import 'package:flutter/material.dart';

class GovernmentCard extends StatelessWidget {
  const GovernmentCard({
    super.key,
    required this.governModel,
     required this.placesBloc,
  });
  final GovernmentModel governModel;
  final PlacesBloc placesBloc;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(
          vertical: context.screenWidth * 0.025,
          horizontal: context.screenWidth * 0.05),
      elevation: 5,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.screenWidth * 0.05),
      ),
      child: InkWell(
        splashColor: AppColors.lightGrey1,
        onTap: () {
          context.push(LandmarkView(bloc:placesBloc ,governmentId: governModel.governId));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                governModel.imageUrl,
                height: context.screenHeight * 0.25,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(context.screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_pin, color: AppColors.grey21),
                        SizedBox(width: 8),
                        Text(governModel.name,
                            style: AppTextStyles.bold18
                                .copyWith(color: AppColors.black37)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(governModel.description,
                        style: AppTextStyles.regular16
                            .copyWith(color: AppColors.darkGrey)),
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
