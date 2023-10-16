import 'package:great_talk/common/run_app.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.verification;
  RunApp.runMyApp(F.appFlavor!);
}
