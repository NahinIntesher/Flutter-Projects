import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_registration/src/utils/constants/colors.dart';
import 'package:login_registration/src/utils/helpers/helper_functions.dart';

class LoginDivider extends StatelessWidget {
  final String text;
  const LoginDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? CustomColors.darkGrey : CustomColors.grey,
            thickness: 0.8,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          text.capitalize!,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? CustomColors.darkGrey : CustomColors.grey,
            thickness: 0.8,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
