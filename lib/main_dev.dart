import 'package:great_talk/common/run_app.dart';
import 'flavors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  F.appFlavor = Flavor.dev;
  await dotenv.load(fileName: 'dev.env');
  await RunApp.runGreatTalk(F.appFlavor!);
}