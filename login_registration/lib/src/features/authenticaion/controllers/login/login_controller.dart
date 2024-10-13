import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_registration/src/utils/constants/image_strings.dart';
import 'package:login_registration/src/utils/helpers/network_manager.dart';
import 'package:login_registration/src/utils/popups/full_screen_loader.dart';
import 'package:login_registration/src/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  // Variables
  final rememberMe = true.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Login
  Future<void> login() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
          'Processing your informations...', CustomImages.loadingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!loginFormKey.currentState!.validate()) return;

      // Is Registered user in the Firebase

      // Show Success Message

      // Move to App Screen
    } catch (e) {
      // Show some Generic Error to the user
      CustomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      FullScreenLoader.stopLoading();
    }
  }
}
