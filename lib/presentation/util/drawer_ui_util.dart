import 'package:great_talk/application/app/flavors.dart';
import 'package:great_talk/presentation/constant/remote_config_constants.dart';

class DrawerUiUtil {
  static String get version =>
      'ver.${RemoteConfigConstants.appVersion} ${F.appFlavor}';
}
