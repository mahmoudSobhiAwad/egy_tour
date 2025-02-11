import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/widget/custom_text_form_field.dart';
import 'package:egy_tour/features/auth/presentation/views/widgets/prefix_in_phone_field.dart';
import 'package:egy_tour/features/auth/presentation/views/widgets/suffix_in_phone_field.dart';
import 'package:flutter/material.dart';

class CustomPhoneFormField extends StatelessWidget {
  const CustomPhoneFormField(
      {super.key,
      required this.phoneController,
      this.enabled = true,
      this.onChanged,
      this.countryCode});
  final TextEditingController phoneController;
  final bool enabled;
  final void Function(CountryCode)? onChanged;
  final CountryCode? countryCode;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      enabled: enabled,
      prefixWidget: PrefixInPhoneFormField(
        countryPhoneCode: countryCode?.dialCode,
      ),
      suffixWidget: SuffixInPhoneFormField(
        onChanged: onChanged,
        countryCode: countryCode?.code,
      ),
      controller: phoneController,
      maxLine: 1,
      textInputType: TextInputType.phone,
      label: "signup.phone".tr(),
    );
  }
}
