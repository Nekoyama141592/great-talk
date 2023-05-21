import 'package:great_talk/common/run_app.dart';
import 'flavors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  F.appFlavor = Flavor.prod;
  await dotenv.load(fileName: 'prod.env');
  await RunApp.runGreatTalk(F.appFlavor!);
}
