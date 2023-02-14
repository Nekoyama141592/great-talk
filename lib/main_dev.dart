import 'package:great_talk/run_app_api.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.DEV;
  RunAppApi.runGreatTalk(F.appFlavor!);
}