import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_arrow_back.dart';
import 'package:egy_tour/core/utils/widget/custom_language_changer.dart';
import 'package:egy_tour/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:egy_tour/features/auth/presentation/views/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key, required this.bloc});
  final AuthBloc bloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Center(
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomArrowBackButton(),
                      ChangingLanguage(),
                    ],
                  ),
                  // Title
                  Text('signup.title'.tr(), style: AppTextStyles.bold24),

                  // Subtitle
                  Text(
                    r"signup.subtitle".tr(),
                    style: AppTextStyles.regular14
                        .copyWith(color: AppColors.grey21),
                  ),

                  // Form
                  SignUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
