import 'package:egy_tour/core/utils/extensions/navigation.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomArrowBackButton extends StatelessWidget {
  const CustomArrowBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration:
          BoxDecoration(color: AppColors.blueDark, shape: BoxShape.circle),
      child: IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.white),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
