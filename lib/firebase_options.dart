// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOrwxc-pDX7V63_72FgdU6jdBbqwZFRz4',
    appId: '1:201484259607:android:b97db3593ae22eea0a6752',
    messagingSenderId: '201484259607',
    projectId: 'flutter-app-49389',
    databaseURL: 'https://flutter-app-49389-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-app-49389.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKq78WfhmX-LpvhDoyEYFklwUtiKu0JY8',
    appId: '1:201484259607:ios:c9ce224f096236550a6752',
    messagingSenderId: '201484259607',
    projectId: 'flutter-app-49389',
    databaseURL: 'https://flutter-app-49389-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-app-49389.appspot.com',
    androidClientId: '201484259607-oohdun28bon8gjacqaqq3tn4idn518j6.apps.googleusercontent.com',
    iosClientId: '201484259607-236ek8qvbn768p8p3ukcmm8064b4so9k.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebase',
  );
}
