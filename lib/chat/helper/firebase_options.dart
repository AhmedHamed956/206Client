import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8m74ObPhZpKplq5q7J7dXDC2hRJNIlFY',
    appId: '1:908919435219:android:e2379cb4cdeb63bb8e4926',
    messagingSenderId: '908919435219',
    projectId: 'prj-ef1f8',
    // storageBucket: 'udemy-ac28e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_dbguB0bWDNuw3N8kF3ORkgidDDG2d6I',
    appId: '1:908919435219:android:e2379cb4cdeb63bb8e4926',
    messagingSenderId: '910516599381',
    projectId: 'udemy-ac28e',
    storageBucket: 'udemy-ac28e.appspot.com',
    iosClientId:
        '910516599381-t765u6d36k1ejen9lt5gogckmcnpeuav.apps.googleusercontent.com',
    iosBundleId: 'com.example.fcmtest',
  );
}
