import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HavingAccountLoginOrSignUp extends StatelessWidget {
  const HavingAccountLoginOrSignUp({
    super.key,
    required this.mainText,
    required this.actionText,
    required this.onTapActionText,
  });
  final String mainText;
  final String actionText;
  final void Function() onTapActionText;
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      text: mainText,
      style: AppTextStyles.regular15,
      children: [
        TextSpan(
          text: actionText,
          style: AppTextStyles.regular15
              .copyWith(decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()..onTap = onTapActionText,
        ),
      ],
    ));
  }
}
