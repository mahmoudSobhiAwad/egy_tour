import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';

class PrefixInPhoneFormField extends StatelessWidget {
  const PrefixInPhoneFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.phone_android, color: AppColors.grey21),

        // Country Code
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            '+20',
            style: AppTextStyles.regular14.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
