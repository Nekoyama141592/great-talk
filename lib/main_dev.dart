import 'dart:async';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:great_talk/common/run_app.dart';
import 'flavors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await runZonedGuarded(() async {
    F.appFlavor = Flavor.dev;
    await dotenv.load(fileName: 'dev.env');
    // Dartのエラーを報告
    await RunApp.runGreatTalk(F.appFlavor!);
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
