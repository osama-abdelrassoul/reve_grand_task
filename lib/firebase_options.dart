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
    apiKey: 'AIzaSyDZ90kY3_BiL4llPpl0J_cMGuVF2r3h5lk',
    appId: '1:919787590222:web:1ea08a75c8cfa792e6691f',
    messagingSenderId: '919787590222',
    projectId: 'reve-grand-task',
    authDomain: 'reve-grand-task.firebaseapp.com',
    databaseURL: 'https://reve-grand-task-default-rtdb.firebaseio.com',
    storageBucket: 'reve-grand-task.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-vhrGg_3yg9RAabGKtYjhLM3RbJtNW6Q',
    appId: '1:919787590222:android:64c293ed59f8ce79e6691f',
    messagingSenderId: '919787590222',
    projectId: 'reve-grand-task',
    databaseURL: 'https://reve-grand-task-default-rtdb.firebaseio.com',
    storageBucket: 'reve-grand-task.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYLkpgSC_SMfyhGgy1wAOGOE3NXIwTKaw',
    appId: '1:919787590222:ios:ba07ee51982da549e6691f',
    messagingSenderId: '919787590222',
    projectId: 'reve-grand-task',
    databaseURL: 'https://reve-grand-task-default-rtdb.firebaseio.com',
    storageBucket: 'reve-grand-task.appspot.com',
    iosClientId: '919787590222-fc9k9eqtn7b4tnr0urhf4gqi7qfk85h1.apps.googleusercontent.com',
    iosBundleId: 'com.example.reveGrandTast',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYLkpgSC_SMfyhGgy1wAOGOE3NXIwTKaw',
    appId: '1:919787590222:ios:ba07ee51982da549e6691f',
    messagingSenderId: '919787590222',
    projectId: 'reve-grand-task',
    databaseURL: 'https://reve-grand-task-default-rtdb.firebaseio.com',
    storageBucket: 'reve-grand-task.appspot.com',
    iosClientId: '919787590222-fc9k9eqtn7b4tnr0urhf4gqi7qfk85h1.apps.googleusercontent.com',
    iosBundleId: 'com.example.reveGrandTast',
  );
}
