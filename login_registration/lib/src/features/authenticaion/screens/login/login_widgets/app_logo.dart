import 'package:flutter/material.dart';
import 'package:login_registration/src/utils/constants/sizes.dart';
import 'package:login_registration/src/utils/constants/text_strings.dart';

class Applogo extends StatelessWidget {
  const Applogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CustomSizes.defaultSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFFFF6929),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/logos/logo_big.png',
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: CustomSizes.defaultSpacing / 2),
          Text(Texts.loginTitle,
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: CustomSizes.sm),
          Text(Texts.loginSubTitle,
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
