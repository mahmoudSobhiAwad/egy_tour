import 'package:egy_tour/core/utils/extensions/navigation.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';
import 'package:egy_tour/features/home/presentation/views/location_view.dart';
import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.landmarkModel,
    required this.toggleIn,
    required this.toggleOut,
  });
  final LandmarkModel landmarkModel;
  final void Function() toggleIn;
  final void Function() toggleOut;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrey2,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 3,
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        width: 180,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    landmarkModel.imageUrl,
                    width: 160,
                    height: 126,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            FittedBox(
              child: Text(
                textAlign: TextAlign.center,
                landmarkModel.title,
                style: AppTextStyles.regular16,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.darkGrey,
                  ),
                  Text(
                    landmarkModel.governName,
                    style: TextStyle(
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      landmarkModel.isFavorite ? toggleOut() : toggleIn();
                    },
                    icon: landmarkModel.isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: AppColors.darkGrey,
                          ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextButton(
                onPressed: () {
                  context.push(LocationView(
                      latitude: landmarkModel.latitude,
                      longitude: landmarkModel.longitude));
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.blueDark),
                ),
                child: Text('Location'))
          ],
        ),
      ),
    );
  }
}
