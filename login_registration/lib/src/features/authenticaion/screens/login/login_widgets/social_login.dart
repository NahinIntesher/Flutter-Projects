import 'package:flutter/material.dart';
import 'package:login_registration/src/utils/constants/colors.dart';
import 'package:login_registration/src/utils/helpers/helper_functions.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: (HelperFunctions.screenWidth() * 0.5),
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage('assets/logos/google.png'),
            ),
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                backgroundColor: CustomColors.borderPrimary,
                side: const BorderSide(color: CustomColors.borderPrimary)),
            label: const Text(
              'Sign in with Google',
              style: TextStyle(fontSize: 16, color: CustomColors.black),
            ),
          ),
        ),

        // const SizedBox(width: CustomSizes.defaultSpacing),
        // Container(
        //   decoration: BoxDecoration(
        //     border: Border.all(color: CustomColors.grey),
        //     borderRadius: BorderRadius.circular(100),
        //   ),
        //   child: IconButton(
        //     onPressed: () {},
        //     icon: const Image(
        //       height: 40,
        //       width: 40,
        //       image: AssetImage('assets/logos/facebook.png'),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
