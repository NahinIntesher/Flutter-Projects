import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_registration/src/features/authenticaion/screens/login/login.dart';
import 'package:login_registration/src/features/authenticaion/screens/signup/verified_success_screen.dart';
import 'package:login_registration/src/utils/constants/colors.dart';
import 'package:login_registration/src/utils/constants/image_strings.dart';
import 'package:login_registration/src/utils/constants/sizes.dart';
import 'package:login_registration/src/utils/constants/text_strings.dart';
import 'package:login_registration/src/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
            color: dark ? CustomColors.white : CustomColors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpacing),
          child: Column(
            children: [
              // Image
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage(CustomImages.emailSend),
                    width: HelperFunctions.screenWidth() * 0.8,
                  ),
                  const SizedBox(height: CustomSizes.spacingBtwSections),
                  // Title & Subtitle
                  Text(
                    Texts.confirmEmail,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: CustomSizes.spacingBtwSections),
                  Text(
                    "user@example.com",
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: CustomSizes.spacingBtwSections),
                  Text(
                    Texts.confirmEmailSubTitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: CustomSizes.spacingBtwSections),
                  // Verify Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => VerifiedSuccessScreen(
                              image: CustomImages.emailVerified,
                              title: Texts.yourAccountCreatedTitle,
                              subTitle: Texts.yourAccountCreatedSubTitle,
                              onPressed: () =>
                                  Get.offAll(() => const LoginScreen()),
                            )),
                        child: const Text(Texts.tContinue)),
                  ),

                  const SizedBox(height: CustomSizes.spacingBtwSections),
                  // Resend Email
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () =>
                            Get.offAll(() => const VerifyEmailScreen()),
                        child: const Text(Texts.resendEmail,
                            style: TextStyle(
                                color: CustomColors.primaryColor,
                                fontSize: CustomSizes.fontSizeSm))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
