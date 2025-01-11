import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/widget/custom_text_form_field.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/prefix_in_phone_field.dart';
import 'package:egy_tour/features/sign_up/presentation/views/widgets/suffix_in_phone_field.dart';
import 'package:flutter/material.dart';

class CustomPhoneFormField extends StatelessWidget {
  const CustomPhoneFormField(
      {super.key, required this.phoneController, this.enabled = true});
  final TextEditingController phoneController;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      enabled: enabled,
      prefixWidget: PrefixInPhoneFormField(),
      suffixWidget: SuffixInPhoneFormField(),
      controller: phoneController,
      maxLine: 1,
      textInputType: TextInputType.phone,
      label: "signup.phone".tr(),
    );
  }
}
