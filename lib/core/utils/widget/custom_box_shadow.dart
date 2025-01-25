import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:flutter/widgets.dart';

BoxShadow customBoxShadow() {
  return BoxShadow(
    color: AppColors.black37.withValues(alpha: 0.1),
    blurRadius: 20,
    offset: Offset(0, 8),
  );
}
