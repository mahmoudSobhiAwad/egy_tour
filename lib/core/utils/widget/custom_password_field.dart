import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({
    super.key,
    this.focusNode,
    this.onFieldSubmitted,
    required this.passwordController,
    required this.isObeseureText,
    this.changeObsecureText,
    this.enabled = true,
    this.validator,
  });
  final FocusNode? focusNode;
  final TextEditingController passwordController;
  final void Function(String?)? onFieldSubmitted;
  final bool isObeseureText;
  final void Function()? changeObsecureText;
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        validator: validator ??
            (value) {
              if (value != null && value.trim().isEmpty) {
                return 'Password Can\'t be empty ';
              }
              return null;
            },
        onFieldSubmitted: onFieldSubmitted,
        controller: passwordController,
        focusNode: focusNode,
        maxLine: 1,
        enabled: enabled,
        textInputAction: TextInputAction.done,
        label: "login.password".tr(),
        borderRadius: 12,
        isObeseureText: isObeseureText,
        prefixWidget: Icon(
          Icons.lock,
          color: AppColors.grey21,
        ),
        suffixWidget: IconButton(
          onPressed: changeObsecureText,
          icon: Icon(
            isObeseureText
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            color: AppColors.grey21,
          ),
        ));
  }
}
