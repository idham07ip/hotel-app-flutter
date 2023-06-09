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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDVqgCI9vzSejLk4RxVXfw2nJHRHDcJxlk',
    appId: '1:633741433311:web:c1034ea8ead27c8598cc6a',
    messagingSenderId: '633741433311',
    projectId: 'db-hotel-app',
    authDomain: 'db-hotel-app.firebaseapp.com',
    storageBucket: 'db-hotel-app.appspot.com',
    measurementId: 'G-HTCFS6LLLH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDL9i5GVXsaGMiwJJ7MvN12FMTbmXM1fHA',
    appId: '1:633741433311:android:4c784fceb53238dd98cc6a',
    messagingSenderId: '633741433311',
    projectId: 'db-hotel-app',
    storageBucket: 'db-hotel-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEs-h8ApqKXcizI4vaJ-7k4MOVDftUZy0',
    appId: '1:633741433311:ios:9bb8c49513396c6298cc6a',
    messagingSenderId: '633741433311',
    projectId: 'db-hotel-app',
    storageBucket: 'db-hotel-app.appspot.com',
    iosClientId: '633741433311-a9m7rf5kvu3uqbppbhjrdje3g2v2ke44.apps.googleusercontent.com',
    iosBundleId: 'com.example.hotelApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEs-h8ApqKXcizI4vaJ-7k4MOVDftUZy0',
    appId: '1:633741433311:ios:9bb8c49513396c6298cc6a',
    messagingSenderId: '633741433311',
    projectId: 'db-hotel-app',
    storageBucket: 'db-hotel-app.appspot.com',
    iosClientId: '633741433311-a9m7rf5kvu3uqbppbhjrdje3g2v2ke44.apps.googleusercontent.com',
    iosBundleId: 'com.example.hotelApp',
  );
}
