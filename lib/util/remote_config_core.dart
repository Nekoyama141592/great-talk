import 'package:great_talk/extension/remote_config_key_extension.dart';

class RemoteConfigCore {
  // key
  static String get maintenanceMsgKey =>
      "maintenance_msg".toOsSpecificRemoteConfigKey;
  static String get forcedUpdateVersionKey =>
      "forced_update_version".toOsSpecificRemoteConfigKey;
}
