import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/extensions/navigation.dart';
import 'package:egy_tour/core/utils/widget/custom_email_field.dart';
import 'package:egy_tour/core/utils/widget/custom_password_field.dart';
import 'package:egy_tour/features/auth/presentation/views/widgets/have_account_login.dart';
import 'package:egy_tour/features/auth/presentation/views/widgets/login_push_buttong.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/auth/presentation/views/widgets/custom_phone_field.dart';
import 'package:egy_tour/features/auth/presentation/views/widgets/user_name_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/bloc/auth_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  bool hiddenPassword = true;
  late CountryCode countryCode;

  @override
  void initState() {
    countryCode = CountryCode(code: 'EG');
    _formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
          ),

          // Phone Field
          BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (prev, curr) {
              return curr is ChangePickedCountryState;
            },
            builder: (context, state) {
              var bloc = context.read<AuthBloc>();
              if (state is ChangePickedCountryState) {
                countryCode = state.countryCode;
              }
              return CustomPhoneFormField(
                countryCode: countryCode,
                onChanged: (country) {
                  bloc.add(ChangePickedCountryEvent(country: country));
                },
                phoneController: phoneController,
              );
            },
          ),

          // Password Field
          BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (curr, prev) {
              return prev is ChangeObsecureTextState;
            },
            builder: (context, state) {
              var bloc = context.read<AuthBloc>();

              if (state is ChangeObsecureTextState) {
                hiddenPassword = state.status;
              }
              return CustomPasswordField(
                  validator: (value) {
                    if (value != null && value.trim().isEmpty) {
                      return 'Password Can\'t be empty ';
                    } else if (value != null && value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  isObeseureText: hiddenPassword,
                  changeObsecureText: () {
                    bloc.add(ChangeObsecureTextEvent(value: hiddenPassword));
                  },
                  passwordController: passwordController);
            },
          ),

          SizedBox(
            height: 25,
          ),

          // Sign Up Button
          CustomPushButton(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                final user = User(
                  userName: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  phoneNumber:
                      '${countryCode.dialCode ?? ""}${phoneController.text}',
                );

                context.read<AuthBloc>().add(SignUpRequested(user: user));
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
