import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_talk/application/app/flavors.dart';
import 'package:great_talk/application/app/run_app.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:great_talk/application/app/my_app.dart';
import 'package:great_talk/core/provider/overrides/prefs/prefs_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await runZonedGuarded(() async {
    F.appFlavor = Flavor.values.firstWhere(
      (element) => element.name == appFlavor,
    );
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: RunApp.getFirebaseOption(F.appFlavor),
    );
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
  }, (e, s) => FirebaseCrashlytics.instance.recordError(e, s));
}
