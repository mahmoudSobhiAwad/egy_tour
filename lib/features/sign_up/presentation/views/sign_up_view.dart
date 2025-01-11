import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_arrow_back.dart';
import 'package:egy_tour/core/utils/widget/custom_language_changer.dart';
import 'package:egy_tour/features/sign_up/data/repos/sign_up_repo_imp.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final SignUpRepoImp signUpRepoImp = SignUpRepoImp();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                Text('signup.title'.tr(), 
                    style: AppTextStyles.bold24),

                // Subtitle
                Text(
                  r"signup.subtitle".tr(), 
                  style:
                      AppTextStyles.regular14.copyWith(color: AppColors.grey21),
                ),

                // Form
                SignUpForm(
                  onChangeObsecure: () {
                    setState(() {
                      hiddenPassword = !hiddenPassword;
                    });
                  },
                  formKey: _formKey,
                  nameController: nameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  hiddenPassword: hiddenPassword,
                  passwordController: passwordController,
                  signUpRepoImp: signUpRepoImp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
