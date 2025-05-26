import 'dart:async';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:great_talk/run_app.dart';
import 'flavors.dart';

void main() async {
  await runZonedGuarded(
    () async {
      F.appFlavor = Flavor.prod;
      // Dartのエラーを報告
      await RunApp.runMyApp(F.appFlavor!);
    },
    (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
    },
  );
}
