import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/extensions/navigation.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/widget/custom_snack_bar.dart';
import 'package:egy_tour/core/utils/widget/custom_email_field.dart';
import 'package:egy_tour/core/utils/widget/custom_password_field.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/have_account_login.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/login_push_buttong.dart';
import 'package:egy_tour/features/sign_up/data/models/user_model.dart';
import 'package:egy_tour/features/sign_up/data/repos/sign_up_repo_imp.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/custom_phone_field.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/user_name_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.hiddenPassword,
    required this.passwordController,
    required this.onChangeObsecure,
    required this.signUpRepoImp,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final bool hiddenPassword;
  final TextEditingController passwordController;
  final void Function() onChangeObsecure;
  final SignUpRepoImp signUpRepoImp;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          // Username Field
          UserNameField(
            nameController: nameController,
          ),

          // Email Field
          CustomEmailField(
            emailController: emailController,
            formKey: formKey,
          ),

          // Phone Field
          CustomPhoneFormField(
            phoneController: phoneController,
          ),

          // Password Field
          CustomPasswordField(
              validator: (value) {
                if (value != null && value.trim().isEmpty) {
                  return 'Password Can\'t be empty ';
                } else if (value != null && value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              isObeseureText: hiddenPassword,
              changeObsecureText: onChangeObsecure,
              passwordController: passwordController),

          SizedBox(
            height: 25,
          ),
          // Sign Up Button
          CustomPushButton(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                await signUpRepoImp
                    .signUp(User(
                        userName: nameController.text,
                        email: emailController.text,
                        phoneNumber: phoneController.text,
                        password: passwordController.text))
                    .then((value) {
                  value.fold((user) {
                    showCustomSnackBar(
                        context, "Accounted Created Successfully");
                    context.pop();
                  }, (error) {
                    showCustomSnackBar(context, error,
                        backgroundColor: AppColors.red);
                  });
                });
              }
            },
            title: "signup.signup_button".tr(),
          ),

          SizedBox(
            height: 20,
          ),

          // Already Have Account
          HavingAccountLoginOrSignUp(
            mainText: 'signup.already_have_account'.tr(),
            actionText: 'signup.login'.tr(),
            onTapActionText: () {
              context.pop();
            },
          )
        ],
      ),
    );
  }
}
