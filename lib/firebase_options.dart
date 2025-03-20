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
    apiKey: 'AIzaSyBlFTCgR4dUJLXrIKVhZlAXlWitj9iUYjI',
    appId: '1:883280042530:web:980215a4cc1a8991ab887b',
    messagingSenderId: '883280042530',
    projectId: 'flutterproject-b7199',
    authDomain: 'flutterproject-b7199.firebaseapp.com',
    storageBucket: 'flutterproject-b7199.firebasestorage.app',
    measurementId: 'G-NVTN1MX1WD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjYRhTaOC5REGxOdOArzy6Vwx7E8ammL8',
    appId: '1:883280042530:android:5fe8450297c59af8ab887b',
    messagingSenderId: '883280042530',
    projectId: 'flutterproject-b7199',
    storageBucket: 'flutterproject-b7199.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFQmavfj48Iz6jXi4m-0HfTPStNoZTsLU',
    appId: '1:883280042530:ios:781e641d0f210199ab887b',
    messagingSenderId: '883280042530',
    projectId: 'flutterproject-b7199',
    storageBucket: 'flutterproject-b7199.firebasestorage.app',
    iosBundleId: 'com.example.task',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFQmavfj48Iz6jXi4m-0HfTPStNoZTsLU',
    appId: '1:883280042530:ios:781e641d0f210199ab887b',
    messagingSenderId: '883280042530',
    projectId: 'flutterproject-b7199',
    storageBucket: 'flutterproject-b7199.firebasestorage.app',
    iosBundleId: 'com.example.task',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBlFTCgR4dUJLXrIKVhZlAXlWitj9iUYjI',
    appId: '1:883280042530:web:0ea45305d5e253cdab887b',
    messagingSenderId: '883280042530',
    projectId: 'flutterproject-b7199',
    authDomain: 'flutterproject-b7199.firebaseapp.com',
    storageBucket: 'flutterproject-b7199.firebasestorage.app',
    measurementId: 'G-DC94HE23GB',
  );

}