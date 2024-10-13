import 'package:flutter/material.dart';
import 'package:login_registration/src/features/authenticaion/screens/login/login_widgets/login_divider.dart';
import 'package:login_registration/src/features/authenticaion/screens/login/login_widgets/social_login.dart';
import 'package:login_registration/src/features/authenticaion/screens/signup/signup_widgets/signup_form.dart';
import 'package:login_registration/src/utils/constants/colors.dart';
import 'package:login_registration/src/utils/constants/sizes.dart';
import 'package:login_registration/src/utils/constants/text_strings.dart';
import 'package:login_registration/src/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: (dark ? CustomColors.white : CustomColors.black)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Text(Texts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: CustomSizes.spacingBtwSections),

              // Form
              const SignupForm(),

              const SizedBox(height: CustomSizes.spacingBtwSections),

              // Divider
              const LoginDivider(text: Texts.orSignUpWith),

              const SizedBox(height: CustomSizes.defaultSpacing),

              // Social login
              const SocialLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
