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
    apiKey: 'AIzaSyCsEq3GRk5SyxLDg4ClXoWry5nK_Q5bs0s',
    appId: '1:1036783461845:web:fc9ba2898ba4b813d5495c',
    messagingSenderId: '1036783461845',
    projectId: 'ecommerc-app-flutter',
    authDomain: 'ecommerc-app-flutter.firebaseapp.com',
    storageBucket: 'ecommerc-app-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDA9aFhPDKO1pbgDQDpbpOJue3qJO6Ar2w',
    appId: '1:1036783461845:android:158cfbda70901501d5495c',
    messagingSenderId: '1036783461845',
    projectId: 'ecommerc-app-flutter',
    storageBucket: 'ecommerc-app-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDW1V9Z_tDD5VhNG4sPaQacdAPRT4sKrNY',
    appId: '1:1036783461845:ios:fa51db8ea03eb495d5495c',
    messagingSenderId: '1036783461845',
    projectId: 'ecommerc-app-flutter',
    storageBucket: 'ecommerc-app-flutter.appspot.com',
    iosClientId: '1036783461845-jr0o7nra9dat1gkrunhjgie9emjpkogr.apps.googleusercontent.com',
    iosBundleId: 'com.example.buyIndiaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDW1V9Z_tDD5VhNG4sPaQacdAPRT4sKrNY',
    appId: '1:1036783461845:ios:d4a923173327e4c7d5495c',
    messagingSenderId: '1036783461845',
    projectId: 'ecommerc-app-flutter',
    storageBucket: 'ecommerc-app-flutter.appspot.com',
    iosClientId: '1036783461845-i9je3n8r7jhspgg881i55m8hkskv0o45.apps.googleusercontent.com',
    iosBundleId: 'com.example.buyIndiaApp.RunnerTests',
  );
}