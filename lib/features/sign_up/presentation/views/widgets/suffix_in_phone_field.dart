import 'package:country_code_picker/country_code_picker.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SuffixInPhoneFormField extends StatelessWidget {
  const SuffixInPhoneFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey1, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: CountryCodePicker(
        alignLeft: true,
        initialSelection: 'EG',
        margin: EdgeInsets.all(0),
        showCountryOnly: false,
        hideMainText: true,
        showDropDownButton: true,
        showOnlyCountryWhenClosed: true,
        favorite: const ['EG'],
        padding: EdgeInsets.all(0),
        flagWidth: 18,
      ),
    );
  }
}
