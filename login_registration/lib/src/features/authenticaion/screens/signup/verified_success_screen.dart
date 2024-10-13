import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_registration/src/features/authenticaion/screens/login/login.dart';
import 'package:login_registration/src/utils/constants/colors.dart';
import 'package:login_registration/src/utils/constants/sizes.dart';
import 'package:login_registration/src/utils/constants/text_strings.dart';
import 'package:login_registration/src/utils/helpers/helper_functions.dart';

class VerifiedSuccessScreen extends StatelessWidget {
  const VerifiedSuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});
  final String image, title, subTitle;
  final VoidCallback onPressed;

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
                    image: AssetImage(image),
                    width: HelperFunctions.screenWidth() * 0.8,
                  ),
                  const SizedBox(height: CustomSizes.spacingBtwSections),

                  // Title & Subtitle
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: CustomSizes.spacingBtwSections),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: CustomSizes.spacingBtwSections),

                  // Verify Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: onPressed, child: const Text(Texts.done)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
