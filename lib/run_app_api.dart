// flutter
import 'package:flutter/material.dart';
// firebase
import 'package:firebase_core/firebase_core.dart';
// packages
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_talk/app.dart';
import 'package:great_talk/flavors.dart';
import 'package:great_talk/gen/firebase_options_dev.dart' as dev;
import 'package:great_talk/gen/firebase_options_prod.dart' as prod;
import 'package:great_talk/gen/firebase_options_verification.dart'
    as verification;

class RunAppApi {
  static Future<void> runGreatTalk(Flavor flavor) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: _getFirebaseOption(flavor));
    await dotenv.load(fileName: '.env');
    runApp(const App());
  }

  static FirebaseOptions _getFirebaseOption(Flavor flavor) {
    switch (flavor) {
      case Flavor.DEV:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case Flavor.PROD:
        return prod.DefaultFirebaseOptions.currentPlatform;
      case Flavor.VERIFICATION:
        return verification.DefaultFirebaseOptions.currentPlatform;
    }
  }
}
