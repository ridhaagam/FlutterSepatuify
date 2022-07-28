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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCq5BZ_c1gXoc2Ybfkw6F_Z4WvtS6eVqVg',
    appId: '1:59023709353:web:a8847e126d20c89ef485b8',
    messagingSenderId: '59023709353',
    projectId: 'projectgatcha',
    authDomain: 'projectgatcha.firebaseapp.com',
    storageBucket: 'projectgatcha.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCK0t5_DjZz3qzhJeO9nd1bZltHVPYnDdE',
    appId: '1:59023709353:android:c624aba46be77c12f485b8',
    messagingSenderId: '59023709353',
    projectId: 'projectgatcha',
    storageBucket: 'projectgatcha.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZJbTIL8PD33ImvzgCZKp88Hbk6JKLMl8',
    appId: '1:59023709353:ios:6b0a68d7063db6fef485b8',
    messagingSenderId: '59023709353',
    projectId: 'projectgatcha',
    storageBucket: 'projectgatcha.appspot.com',
    iosClientId: '59023709353-chi8b441nl1qno88sir276dfsa38kgun.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileOne',
  );
}
