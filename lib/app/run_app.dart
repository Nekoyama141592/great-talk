import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:great_talk/app/flavors.dart';
import 'package:great_talk/gen/firebase_options_dev.dart' as dev;
import 'package:great_talk/gen/firebase_options_prod.dart' as prod;
import 'package:great_talk/app/my_app.dart';
import 'package:great_talk/provider/overrides/prefs/prefs_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RunApp {
  static Future<void> runMyApp(Flavor flavor) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: getFirebaseOption(flavor));
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    runApp(
      ProviderScope(
        overrides: [
          prefsProvider.overrideWithValue(
            await SharedPreferences.getInstance(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }

  static FirebaseOptions getFirebaseOption(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case Flavor.prod:
        return prod.DefaultFirebaseOptions.currentPlatform;
    }
  }
}
