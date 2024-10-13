import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_registration/splash_screen.dart';
import 'package:login_registration/src/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:login_registration/src/utils/exceptions/firebase_exceptions.dart';
import 'package:login_registration/src/utils/exceptions/format_exceptions.dart';
import 'package:login_registration/src/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    // Local Storage
    deviceStorage.write("FirstTime", true);
    deviceStorage.read("FirstTime") == true
        ? Get.offAll(() => const SplashScreen())
        : Get.offAll(() => const SplashScreen());
  }

  /* ---------------------- Email & Password sign-in ------------------------ */

  // [Email Authentication] - SignIn

  // [Email Authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [ReAuthenticate] - ReAuthenticate User

  // [EmailVerification] - Send Email Verification

  // [Email Authentication] - Forgot Password

  /* ---------------------- Google Sign-in ------------------------ */
}
