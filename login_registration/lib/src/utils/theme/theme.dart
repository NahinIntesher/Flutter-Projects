import 'package:flutter/material.dart';
import 'package:login_registration/src/utils/constants/colors.dart';
import 'package:login_registration/src/utils/theme/custom_themes/appbar_theme.dart';
import 'package:login_registration/src/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:login_registration/src/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:login_registration/src/utils/theme/custom_themes/chip_theme.dart';
import 'package:login_registration/src/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:login_registration/src/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:login_registration/src/utils/theme/custom_themes/text_field_theme.dart';
import 'package:login_registration/src/utils/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: CustomColors.primaryColor,
    textTheme: CustomTextTheme.lightTextTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppbarTheme.lightAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetThemes.lightBottomSheetTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: CutomElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: CustomColors.primaryColor,
    textTheme: CustomTextTheme.darkTextTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppbarTheme.darkAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetThemes.darkBottomSheetTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: CutomElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
  );

  static BoxDecoration gradientBackground() {
    return const BoxDecoration(
      gradient: CustomColors.linearGradient,
    );
  }
}
