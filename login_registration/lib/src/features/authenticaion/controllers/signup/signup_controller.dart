import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_registration/src/data/repositories/authentication/authentication_repository.dart';
import 'package:login_registration/src/data/repositories/user/user_repository.dart';
import 'package:login_registration/src/features/authenticaion/models/user_models.dart';
import 'package:login_registration/src/features/authenticaion/screens/signup/verify_email.dart';
import 'package:login_registration/src/utils/constants/image_strings.dart';
import 'package:login_registration/src/utils/helpers/network_manager.dart';
import 'package:login_registration/src/utils/popups/full_screen_loader.dart';
import 'package:login_registration/src/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get to => Get.find();

  // Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Sign-up
  Future<void> signUp() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
          'Processing your informations...', CustomImages.loadingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        CustomLoaders.errorSnackBar(
            title: 'No Internet Connection',
            message: 'Please check your internet connection');
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        FullScreenLoader.stopLoading();
        CustomLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create acount, you must have to read and accept the Privacy Policy & Terms of Use',
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
        username: username.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        hashedPassword: BCrypt.hashpw(password.text.trim(), BCrypt.gensalt()),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      FullScreenLoader.stopLoading();

      // Show Success Message
      CustomLoaders.successSnackBar(
          title: 'Account Created', message: 'Your account has been created');

      // Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // Remove Loader
      FullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      CustomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
