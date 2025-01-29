
import 'package:egy_tour/core/utils/extensions/navigation.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/widget/custom_dialog.dart';
import 'package:flutter/material.dart';

Future<bool?> showDialogToStayOrExit(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          bigIcon: CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.lightGrey1,
            child: Center(child: Icon(Icons.logout_rounded,size:40,color: AppColors.black37,)),
          ),
          mainTitle: "Are you Sure To Exist",
          firstActionName: "Exit",
          secondActionName: "Stay",
          onTapSecondAction: () {
            context.pop();
          },
          onTapFirstAction: () {
            context.pop(true);
          },
        );
      });
}

