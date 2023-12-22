import 'package:great_talk/extensions/remote_config_key_extension.dart';

class RemoteConfigConstants {
  static const int appVersion = 182;
  static const chatLimitPerDay = 15; // 一日にできる会話数.
  static const String maintenanceMsg = "メンテナンス中";
  static const String forcedUpdateMsg = "最新バージョンへのアップデートが必要です。";
  // key
  static const chatLimitPerDayKey = "chat_limit_per_day";
  static final maintenanceModeKey =
      "maintenance_mode".toOsSpecificRemoteConfigKey;
  static final maintenanceMsgKey =
      "maintenance_msg".toOsSpecificRemoteConfigKey;
  static final forcedUpdateVersionKey =
      "forced_update_version".toOsSpecificRemoteConfigKey;
  static final forcedUpdateMsgKey =
      "forced_update_msg".toOsSpecificRemoteConfigKey;
}
