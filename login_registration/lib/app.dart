import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_registration/src/utils/constants/colors.dart';
import 'package:login_registration/src/utils/constants/sizes.dart';
import 'package:login_registration/src/utils/constants/text_strings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.menu,
              size: CustomSizes.lg,
              color: CustomColors.white,
            ),
            title: const Text(
              Texts.appName,
              style: TextStyle(
                color: CustomColors.white,
                fontSize: CustomSizes.lg,
              ),
            ),
            centerTitle: true,
            backgroundColor: CustomColors.primaryColor,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(
                    controller.isLightMode ? Icons.dark_mode : Icons.light_mode,
                    color: CustomColors.white,
                  ),
                  onPressed: controller.toggleTheme,
                ),
              ),
            ],
          ),
          body: Center(
            child: Text(
              'Project Structure is set up and running.',
              style: TextStyle(
                color: controller.isLightMode
                    ? CustomColors.black
                    : CustomColors.white,
                fontSize: CustomSizes.md,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}

class ThemeController extends GetxController {
  bool isLightMode = true;

  void toggleTheme() {
    isLightMode = !isLightMode;
    Get.changeThemeMode(isLightMode ? ThemeMode.light : ThemeMode.dark);
    update();
  }
}
