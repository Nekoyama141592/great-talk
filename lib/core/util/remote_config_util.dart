import 'package:great_talk/core/extension/remote_config_key_extension.dart';

class RemoteConfigUtil {
  // key
  static String get maintenanceMsgKey =>
      "maintenance_msg".toOsSpecificRemoteConfigKey;
  static String get forcedUpdateVersionKey =>
      "forced_update_version".toOsSpecificRemoteConfigKey;
}
