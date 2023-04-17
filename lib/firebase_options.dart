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
    apiKey: 'AIzaSyAPrRucei5oC0Sig2Ec65iendChfn7PTxs',
    appId: '1:36270812400:web:c1a639d1b5a25846be2635',
    messagingSenderId: '36270812400',
    projectId: 'book-list-sample-79b61',
    authDomain: 'book-list-sample-79b61.firebaseapp.com',
    storageBucket: 'book-list-sample-79b61.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAY1Z5ZgcREef8AT32NUdU-NRG1bSXVhQI',
    appId: '1:36270812400:android:4dae0329a1eec90cbe2635',
    messagingSenderId: '36270812400',
    projectId: 'book-list-sample-79b61',
    storageBucket: 'book-list-sample-79b61.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0u5ZKnLhSRXCz_bTfZxYmUM6_tlQhzVk',
    appId: '1:36270812400:ios:4c7d180ba9ce7dffbe2635',
    messagingSenderId: '36270812400',
    projectId: 'book-list-sample-79b61',
    storageBucket: 'book-list-sample-79b61.appspot.com',
    iosClientId: '36270812400-tua1rmg4tidc3cici084lsgq3sl7emk1.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookListSample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0u5ZKnLhSRXCz_bTfZxYmUM6_tlQhzVk',
    appId: '1:36270812400:ios:4c7d180ba9ce7dffbe2635',
    messagingSenderId: '36270812400',
    projectId: 'book-list-sample-79b61',
    storageBucket: 'book-list-sample-79b61.appspot.com',
    iosClientId: '36270812400-tua1rmg4tidc3cici084lsgq3sl7emk1.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookListSample',
  );
}