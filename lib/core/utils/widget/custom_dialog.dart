import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/login_push_buttong.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      required this.mainTitle,
      this.subTitle,
      this.bigIcon,
      this.firstActionName,
      this.secondActionName,
      this.onTapFirstAction,
      this.onTapSecondAction});
  final String mainTitle;
  final String? subTitle;
  final String? firstActionName;
  final String? secondActionName;
  final void Function()? onTapFirstAction;
  final void Function()? onTapSecondAction;
  final Widget? bigIcon;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: Duration.zero,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Text(
              mainTitle,
              style: AppTextStyles.bold16,
            ),
            if (subTitle != null)
              Text(
                "$subTitle",
                style: AppTextStyles.regular14,
              ),
            if (bigIcon != null) bigIcon!,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (firstActionName != null)
                  Expanded(
                    child: CustomPushButton(
                      backgroundColor: AppColors.red,
                      onTap: onTapFirstAction,
                      title: firstActionName!,
                    ),
                  ),
                if (secondActionName != null)
                  Expanded(
                    child: CustomPushButton(
                      backgroundColor: AppColors.green,
                      onTap: onTapSecondAction,
                      title: secondActionName!,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
