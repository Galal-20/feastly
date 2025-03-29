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
    apiKey: 'AIzaSyBa0tsEEdCH5bLxieztyqmG-beUU4xqsEs',
    appId: '1:137749814345:android:369e6fcc4275f33bd9b398',
    messagingSenderId: '137749814345',
    projectId: 'meal-recommendations---b1',
    storageBucket: 'meal-recommendations---b1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUgNVNrYm4Ph5Ysk77eIC3HNyn0hwL6kY',
    appId: '1:137749814345:ios:cd271bff36eb23abd9b398',
    messagingSenderId: '137749814345',
    projectId: 'meal-recommendations---b1',
    storageBucket: 'meal-recommendations---b1.appspot.com',
    androidClientId: '137749814345-00kbtjnqhnof1pe8kee4j334uehm8nqf.apps.googleusercontent.com',
    iosClientId: '137749814345-4bctiifr8ikslbfitqq48j2anl56u0ou.apps.googleusercontent.com',
    iosBundleId: 'com.example.feastly',
  );

}