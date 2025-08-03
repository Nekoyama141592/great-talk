import 'dart:io';
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_talk/application/app/flavors.dart';
import 'package:great_talk/application/app/run_app.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:great_talk/application/store_config.dart';
import 'package:great_talk/presentation/util/revenuecat_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:great_talk/application/app/my_app.dart';
import 'package:great_talk/core/provider/overrides/prefs/prefs_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

void main() async {
  await runZonedGuarded(() async {
    F.appFlavor = Flavor.values.firstWhere(
      (element) => element.name == appFlavor,
    );
    final flavor = F.appFlavor;
    await dotenv.load(fileName: 'assets/env/.env.${flavor.name}');
    if (Platform.isIOS) {
      StoreConfig(
        store: Store.appStore,
        apiKey: dotenv.get('REVENUECAT_APP_STORE_API_KEY'),
      );
    } else {
      StoreConfig(
        store: Store.playStore,
        apiKey: dotenv.get('REVENUECAT_PLAY_STORE_API_KEY'),
      );
    }
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: RunApp.getFirebaseOption(F.appFlavor),
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    await RevenuecatUtil.configureSDK();
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
