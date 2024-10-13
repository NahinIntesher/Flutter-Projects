import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_registration/src/features/authenticaion/controllers/signup/signup_controller.dart';
import 'package:login_registration/src/utils/constants/colors.dart';
import 'package:login_registration/src/utils/constants/sizes.dart';
import 'package:login_registration/src/utils/constants/text_strings.dart';
import 'package:login_registration/src/utils/helpers/helper_functions.dart';

class TermsConditionsCheckbox extends StatelessWidget {
  const TermsConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) {
                  controller.privacyPolicy.value =
                      !controller.privacyPolicy.value;
                },
                activeColor: CustomColors.secondaryColor,
              )),
        ),
        const SizedBox(width: CustomSizes.spaceBtwInputFields),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${Texts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: '${Texts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color:
                          dark ? CustomColors.white : CustomColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? CustomColors.white : CustomColors.primaryColor,
                    ),
              ),
              TextSpan(
                text: '${Texts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: '${Texts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color:
                          dark ? CustomColors.white : CustomColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? CustomColors.white : CustomColors.primaryColor,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
