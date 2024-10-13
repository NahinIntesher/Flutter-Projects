import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_registration/src/features/authenticaion/controllers/login/login_controller.dart';
import 'package:login_registration/src/features/authenticaion/screens/forget_password/forget_password.dart';
import 'package:login_registration/src/features/authenticaion/screens/signup/signup.dart';
import 'package:login_registration/src/utils/constants/colors.dart';
import 'package:login_registration/src/utils/constants/sizes.dart';
import 'package:login_registration/src/utils/constants/text_strings.dart';
import 'package:login_registration/src/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: CustomSizes.defaultSpacing),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => CustomValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: Texts.email,
              ),
            ),

            const SizedBox(height: CustomSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              controller: controller.password,
              validator: (value) => CustomValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: Texts.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),

            const SizedBox(height: CustomSizes.spaceBtwInputFields / 2),

            // Remember me & Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value =
                              !controller.rememberMe.value;
                        },
                        activeColor: CustomColors.secondaryColor,
                      ),
                    ),
                    const Text(Texts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetPassword());
                  },
                  child: const Text(
                    Texts.forgetPassword,
                    style: TextStyle(
                      color: CustomColors.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: CustomSizes.spaceBtwInputFields),

            // Login Button
            SizedBox(
              height: 60,
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: CustomColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  side: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                onPressed: () => controller.login(),
                child: const Text(
                  Texts.signIn,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            const SizedBox(height: CustomSizes.spaceBtwInputFields / 2),

            // Create account button
            SizedBox(
              height: 60,
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  side: const BorderSide(
                    color: CustomColors.secondaryColor,
                  ),
                ),
                onPressed: () {
                  Get.to(() => const SignupScreen());
                },
                child: const Text(Texts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
