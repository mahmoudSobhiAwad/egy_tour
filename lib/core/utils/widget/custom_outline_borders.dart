import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

OutlineInputBorder customOutLineBorders(
    {double? borderRadius, Color? borderColor, double? borderWidth}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.white,
        width: borderWidth ?? 2,
      ));
}
