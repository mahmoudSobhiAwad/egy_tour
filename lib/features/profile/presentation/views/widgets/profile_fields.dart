import 'package:egy_tour/core/utils/widget/custom_email_field.dart';
import 'package:egy_tour/core/utils/widget/custom_password_field.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/custom_phone_field.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/user_name_field.dart';
import 'package:flutter/material.dart';

class ProfileFields extends StatelessWidget {
  const ProfileFields({
    super.key,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController passwordController,
  })  : _nameController = nameController,
        _emailController = emailController,
        _phoneController = phoneController,
        _passwordController = passwordController;

  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _phoneController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          UserNameField(
            nameController: _nameController,
            enabled: false,
          ),
          CustomEmailField(
            emailController: _emailController,
            enabled: false,
          ),
          CustomPhoneFormField(
              phoneController: _phoneController, enabled: false),
          CustomPasswordField(
            enabled: false,
            passwordController: _passwordController,
            isObeseureText: true,
          )
        ],
      ),
    );
  }
}
