import 'package:flutter/material.dart';
import 'package:login_registration/src/utils/constants/colors.dart';

class GradientTheme {
  static const LinearGradient gradientTheme = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      CustomColors.primaryColor,
      CustomColors.secondaryColor,
    ],
  );
}
