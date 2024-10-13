// lib/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_registration/src/features/authenticaion/screens/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreeneState createState() => _SplashScreeneState();
}

class _SplashScreeneState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xFFFF6929),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/logos/logo_big.png',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30), // Spacing between logo and loader
              const LinearLoadingIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class LinearLoadingIndicator extends StatefulWidget {
  const LinearLoadingIndicator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LinearLoadingIndicatorState createState() => _LinearLoadingIndicatorState();
}

class _LinearLoadingIndicatorState extends State<LinearLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Repeat the animation and reverse it
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 150, // Width of the loading line
          height: 5, // Height of the loading line
          decoration: BoxDecoration(
            color: Colors.orange, // Color of the loading line
            borderRadius: BorderRadius.circular(2.5), // Rounded corners
          ),
          transform: Matrix4.translationValues(
            _controller.value * 200 -
                100, // Moves the line from left to right and vice versa
            0,
            0,
          ),
        );
      },
    );
  }
}
