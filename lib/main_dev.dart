import 'package:great_talk/run_app_api.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.dev;
  RunAppApi.runGreatTalk(F.appFlavor!);
}
