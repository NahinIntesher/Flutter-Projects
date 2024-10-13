import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_registration/src/features/authenticaion/controllers/signup/signup_controller.dart';
import 'package:login_registration/src/features/authenticaion/screens/signup/signup_widgets/terms_conditions_checkbox.dart';
import 'package:login_registration/src/utils/constants/colors.dart';
import 'package:login_registration/src/utils/constants/sizes.dart';
import 'package:login_registration/src/utils/constants/text_strings.dart';
import 'package:login_registration/src/utils/validators/validation.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      CustomValidator.validateEmptyText('First Name', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: Texts.firstName,
                  ),
                ),
              ),
              const SizedBox(width: CustomSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      CustomValidator.validateEmptyText('Last Name', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: Texts.lastName,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: CustomSizes.spaceBtwInputFields),

          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                CustomValidator.validateEmptyText('Username', value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: Texts.username,
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwInputFields),

          // Phone number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => CustomValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: Texts.phoneNo,
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => CustomValidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: Texts.email,
            ),
          ),

          const SizedBox(height: CustomSizes.spaceBtwInputFields),
          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => CustomValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: Texts.password,
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                ),
              ),
            ),
          ),

          const SizedBox(height: CustomSizes.spacingBtwSections),

          // Terms and conditions
          const TermsConditionsCheckbox(),
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
              onPressed: () => controller.signUp(),
              child: const Text(
                Texts.createAccount,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
