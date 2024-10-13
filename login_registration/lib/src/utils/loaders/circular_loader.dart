import 'package:flutter/material.dart';
import 'package:login_registration/src/utils/constants/colors.dart';
import 'package:login_registration/src/utils/constants/sizes.dart';

/// A circular loader widget with customizable foreground and background colors.
class CircularLoader extends StatelessWidget {
  /// Default constructor for the TCircularLoader.
  ///
  /// Parameters:
  ///   - foregroundColor: The color of the circular loader.
  ///   - backgroundColor: The background color of the circular loader.
  const CircularLoader({
    super.key,
    this.foregroundColor = Colors.white,
    this.backgroundColor = CustomColors.primaryColor,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CustomSizes.lg),
      decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle), // Circular background
      child: Center(
        child: CircularProgressIndicator(
            color: foregroundColor,
            backgroundColor: Colors.transparent), // Circular loader
      ),
    );
  }
}
