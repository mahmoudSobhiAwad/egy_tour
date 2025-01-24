import 'package:egy_tour/core/utils/widget/custom_email_field.dart';
import 'package:egy_tour/core/utils/widget/custom_password_field.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/custom_phone_field.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/user_name_field.dart';
import 'package:flutter/material.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';

class ProfileFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final VoidCallback? onSave;

  const ProfileFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isObeseureText = ValueNotifier<bool>(true);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserNameField(
            nameController: nameController,
            enabled: true,
          ),
          const SizedBox(height: 16),
          CustomEmailField(
            emailController: emailController,
            enabled: false,
          ),
          const SizedBox(height: 16),
          CustomPhoneFormField(phoneController: phoneController, enabled: true),
          const SizedBox(height: 16),
          ValueListenableBuilder(
            valueListenable: isObeseureText,
            builder: (BuildContext context, dynamic value, Widget? child) {
              return CustomPasswordField(
                enabled: true,
                passwordController: passwordController,
                isObeseureText: value,
                changeObsecureText: () {
                  isObeseureText.value = !isObeseureText.value;
                },
              );
            },
          ),

          const SizedBox(height: 24), // Larger space before button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blueDark,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
