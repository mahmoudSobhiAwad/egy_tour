import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';
import 'package:flutter/material.dart';

import '../../../features/sign_up/data/models/user_model.dart';
import '../theme/app_colors.dart';

class PlaceCard extends StatefulWidget {
  final LandmarkModel landmarkModel;
  final User? user;
  const PlaceCard({super.key, required this.landmarkModel, required this.user});

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
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
                    widget.landmarkModel.imageUrl,
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
                widget.landmarkModel.title,
                style: AppTextStyles.regular16,
              ),
            ),
            SizedBox(
              height: 5,
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
                    widget.landmarkModel.governName,
                    style: TextStyle(
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      widget.landmarkModel.isFavorite =
                          !widget.landmarkModel.isFavorite;
                      widget.landmarkModel.isFavorite
                          ? widget.user?.favorites
                              .add(widget.landmarkModel.uniqueId)
                          : widget.user?.favorites
                              .remove(widget.landmarkModel.uniqueId);

                      setState(() {});
                    },
                    icon: widget.landmarkModel.isFavorite
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
          ],
        ),
      ),
    );
  }
}
