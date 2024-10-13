// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...c
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDr4ZBzLCTemFDPoyDqn109J9cX6Hwudjc',
    appId: '1:1090234148629:web:9f9f2476c19f34c0726b1c',
    messagingSenderId: '1090234148629',
    projectId: 'uiu-question-bank-test',
    authDomain: 'uiu-question-bank-test.firebaseapp.com',
    storageBucket: 'uiu-question-bank-test.appspot.com',
    measurementId: 'G-Z24QGSV9G0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQWSq7KnwkMJpsfDOc3X3qL22QgWqI0K8',
    appId: '1:1090234148629:android:211847fe74c86549726b1c',
    messagingSenderId: '1090234148629',
    projectId: 'uiu-question-bank-test',
    storageBucket: 'uiu-question-bank-test.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0HWsWedLouw3HKkBq5jslLvaLR48SUdk',
    appId: '1:1090234148629:ios:93b71b70167f1775726b1c',
    messagingSenderId: '1090234148629',
    projectId: 'uiu-question-bank-test',
    storageBucket: 'uiu-question-bank-test.appspot.com',
    androidClientId: '1090234148629-kd9ddsecb6i1rv679ol0h5ja2u5on851.apps.googleusercontent.com',
    iosClientId: '1090234148629-j5kpbka5fqol1507sdrfb5rssv041u90.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginRegistration',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0HWsWedLouw3HKkBq5jslLvaLR48SUdk',
    appId: '1:1090234148629:ios:93b71b70167f1775726b1c',
    messagingSenderId: '1090234148629',
    projectId: 'uiu-question-bank-test',
    storageBucket: 'uiu-question-bank-test.appspot.com',
    androidClientId: '1090234148629-kd9ddsecb6i1rv679ol0h5ja2u5on851.apps.googleusercontent.com',
    iosClientId: '1090234148629-j5kpbka5fqol1507sdrfb5rssv041u90.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginRegistration',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDr4ZBzLCTemFDPoyDqn109J9cX6Hwudjc',
    appId: '1:1090234148629:web:f0801fc9eb59ae95726b1c',
    messagingSenderId: '1090234148629',
    projectId: 'uiu-question-bank-test',
    authDomain: 'uiu-question-bank-test.firebaseapp.com',
    storageBucket: 'uiu-question-bank-test.appspot.com',
    measurementId: 'G-SEWVXCQVYG',
  );

}