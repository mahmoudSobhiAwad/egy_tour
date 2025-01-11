import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/extensions/navigation.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_email_field.dart';
import 'package:egy_tour/core/utils/widget/custom_password_field.dart';
import 'package:egy_tour/core/utils/widget/custom_snack_bar.dart';
import 'package:egy_tour/features/basic/presentation/views/basic_view.dart';
import 'package:egy_tour/features/login/data/repos/login_repo_imp.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/have_account_login.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/login_push_buttong.dart';
import 'package:egy_tour/core/utils/widget/title_with_changing_lang.dart';
import 'package:egy_tour/features/sign_up/data/models/user_model.dart';
import 'package:egy_tour/features/sign_up/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

final LoginRepoImp loginRepoImp = LoginRepoImp();
late FocusNode _focusNode1;
late FocusNode _focusNode2;
late TextEditingController emailController;
late TextEditingController passwordController;
final formKey = GlobalKey<FormState>();
bool isObeseureText = false;

class _LoginBodyState extends State<LoginBody> {
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _focusNode1 = FocusNode();
    _focusNode2 = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 10,
              children: [
                SizedBox(
                  height: context.screenHeight * 0.025,
                ),
                const TitleWithLangaugeChanging(),
                SizedBox(
                  height: context.screenHeight * 0.125,
                ),
                Text(
                  "login.welcome_title".tr(),
                  style: AppTextStyles.bold28,
                ),
                Text(
                  "login.welcome_subtitle".tr(),
                  textAlign: TextAlign.center,
                  style:
                      AppTextStyles.regular14.copyWith(color: AppColors.grey21),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomEmailField(
                  emailController: emailController,
                  focusNode: _focusNode1,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomPasswordField(
                  onFieldSubmitted: (value) {
                    _focusNode2.unfocus();
                  },
                  passwordController: passwordController,
                  focusNode: _focusNode2,
                  isObeseureText: isObeseureText,
                  changeObsecureText: () {
                    setState(() {
                      isObeseureText = !isObeseureText;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomPushButton(
                  onTap: () async {
                    _focusNode1.unfocus();
                    _focusNode2.unfocus();
                    if (formKey.currentState!.validate()) {
                      await loginFun(context);
                    }
                  },
                  title: 'login.login_button'.tr(),
                ),
                HavingAccountLoginOrSignUp(
                  mainText: "login.no_account".tr(),
                  actionText: 'login.create'.tr(),
                  onTapActionText: () {
                    context.push(SignUpView());
                  },
                ),
                SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loginFun(BuildContext context) async {
    await loginRepoImp
        .checkLogin(User(
            userName: "",
            email: emailController.text,
            password: passwordController.text))
        .then((value) {
      value.fold((model) {
        if (model != null) {
          context.pushReplacement(BasicView(
            email: model.email,
          ));
        } else {
          showCustomSnackBar(context, "Email or Password is not correct",
              backgroundColor: AppColors.red);
        }
      }, (error) {
        showCustomSnackBar(context, error, backgroundColor: AppColors.red);
      });
    });
  }
}
