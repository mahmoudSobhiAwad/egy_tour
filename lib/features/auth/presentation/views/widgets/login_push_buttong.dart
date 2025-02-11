import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';

class CustomPushButton extends StatelessWidget {
  const CustomPushButton({
    super.key,
    this.onTap,
    required this.title,
    this.backgroundColor,
    this.isLoading = false,
  });
  final void Function()? onTap;
  final String title;
  final Color? backgroundColor;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.screenWidth * 0.7,
        margin: EdgeInsets.symmetric(horizontal: 25),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: backgroundColor ?? AppColors.blueLight,
        ),
        child: isLoading
            ? Center(
              child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
            )
            : Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.bold18.copyWith(color: AppColors.white),
              ),
      ),
    );
  }
}
