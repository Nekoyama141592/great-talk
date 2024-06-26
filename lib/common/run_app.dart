import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:great_talk/app.dart';
import 'package:great_talk/flavors.dart';
import 'package:great_talk/gen/firebase_options_dev.dart' as dev;
import 'package:great_talk/gen/firebase_options_prod.dart' as prod;
import 'package:great_talk/gen/firebase_options_verification.dart'
    as verification;

class RunApp {
  static Future<void> runMyApp(Flavor flavor) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: getFirebaseOption(flavor));
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    runApp(const App());
  }

  static FirebaseOptions getFirebaseOption(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case Flavor.prod:
        return prod.DefaultFirebaseOptions.currentPlatform;
      case Flavor.verification:
        return verification.DefaultFirebaseOptions.currentPlatform;
    }
  }
}
