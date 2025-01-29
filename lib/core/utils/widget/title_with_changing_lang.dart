import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_language_changer.dart';
import 'package:flutter/material.dart';

class TitleWithLangaugeChanging extends StatelessWidget {
  const TitleWithLangaugeChanging({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "login.app_name".tr(),
          style: AppTextStyles.bold36.copyWith(color: AppColors.white),
        ),
        ChangingLanguage()
      ],
    );
  }
}


