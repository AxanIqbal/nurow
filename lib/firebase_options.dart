// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBPVv7RNZW0JEDlV3r9V9YbiAaaozHk5gk',
    appId: '1:658864643652:web:572d6a00c2209730ee6611',
    messagingSenderId: '658864643652',
    projectId: 'nurowai',
    authDomain: 'nurowai.firebaseapp.com',
    storageBucket: 'nurowai.appspot.com',
    measurementId: 'G-XMXCBW0VRX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC75UTIk7pINDCRbEJPdGaIrTGMxSOuhYo',
    appId: '1:658864643652:android:1b874cf8d1e91ff5ee6611',
    messagingSenderId: '658864643652',
    projectId: 'nurowai',
    storageBucket: 'nurowai.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_YrCS0_ISVyH7Dop-iQ_kJHYG9neYHr0',
    appId: '1:658864643652:ios:a84d9e810b6c5fc6ee6611',
    messagingSenderId: '658864643652',
    projectId: 'nurowai',
    storageBucket: 'nurowai.appspot.com',
    iosClientId: '658864643652-ocn0n8mdn09nt38qufk7skogpll8eol5.apps.googleusercontent.com',
    iosBundleId: 'com.nurowai',
  );
}
