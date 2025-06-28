import 'package:firebase_core/firebase_core.dart';
import 'package:great_talk/application/app/flavors.dart';
import 'package:great_talk/gen/firebase_options_dev.dart' as dev;
import 'package:great_talk/gen/firebase_options_verification.dart'
    as verification;
import 'package:great_talk/gen/firebase_options_prod.dart' as prod;

class RunApp {
  static FirebaseOptions getFirebaseOption(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case Flavor.verification:
        return verification.DefaultFirebaseOptions.currentPlatform;
      case Flavor.prod:
        return prod.DefaultFirebaseOptions.currentPlatform;
    }
  }
}
