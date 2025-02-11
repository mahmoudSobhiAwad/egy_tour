import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({
    super.key,
    required this.nameController,
    this.enabled=true,
  });

  final TextEditingController nameController;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      enabled: enabled,
      controller: nameController,
      label: "signup.username".tr(),
      prefixWidget: Icon(
        Icons.person,
        color: Colors.grey,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your full name';
        }
        if (value[0] != value[0].toUpperCase()) {
          return 'First letter must be capitalized';
        }
        return null;
      },
    );
  }
}
