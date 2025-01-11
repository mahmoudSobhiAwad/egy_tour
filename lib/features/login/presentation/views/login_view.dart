import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/login_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: -context.screenHeight * 0.25,
            left: context.locale.languageCode == 'ar' ? null:-110,
            right: context.locale.languageCode == 'ar' ? -110 : null,
            child: Container(
              height: 342,
              width: 342,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [AppColors.purple, AppColors.blueLight]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: LoginBody(),
          ),
        ],
      )),
    );
  }
}
