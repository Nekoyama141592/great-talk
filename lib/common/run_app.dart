// flutter
import 'package:flutter/material.dart';
// firebase
import 'package:firebase_core/firebase_core.dart';
// packages
import 'package:great_talk/app.dart';
import 'package:great_talk/flavors.dart';
import 'package:great_talk/gen/firebase_options_dev.dart' as dev;
import 'package:great_talk/gen/firebase_options_prod.dart' as prod;
import 'package:great_talk/gen/firebase_options_verification.dart'
    as verification;

class RunApp {
  static Future<void> runGreatTalk(Flavor flavor) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: getFirebaseOption(flavor));
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
