import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';

class ChangingLanguage extends StatelessWidget {
  const ChangingLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 2, color: AppColors.blueLight),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        spacing: 2,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.locale.languageCode == 'ar' ? 'العربية' : "English",
            style: AppTextStyles.bold10,
          ),
          PopupMenuButton(
              padding: EdgeInsets.all(0),
              child: Icon(Icons.arrow_drop_down_sharp),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      onTap: () {
                        context.setLocale(Locale('en'));
                      },
                      child: Text(
                        "English",
                        style: AppTextStyles.bold10,
                      )),
                  PopupMenuItem(
                      onTap: () {
                        context.setLocale(Locale('ar'));
                      },
                      child: Text(
                        "العربية",
                        style: AppTextStyles.bold10,
                      )),
                ];
              })
        ],
      ),
    );
  }
}
