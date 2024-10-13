import 'package:flutter/material.dart';
import 'package:login_registration/src/common_widgets/styles/spacing_style.dart';
import 'package:login_registration/src/features/authenticaion/screens/login/login_widgets/app_logo.dart';
import 'package:login_registration/src/features/authenticaion/screens/login/login_widgets/login_divider.dart';
import 'package:login_registration/src/features/authenticaion/screens/login/login_widgets/login_form.dart';
import 'package:login_registration/src/features/authenticaion/screens/login/login_widgets/social_login.dart';
import 'package:login_registration/src/utils/constants/sizes.dart';
import 'package:login_registration/src/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo
              Applogo(),

              // Form
              LoginForm(),

              // Divider
              LoginDivider(text: Texts.orSignInWith),

              SizedBox(height: CustomSizes.defaultSpacing),

              // Social login
              SocialLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
