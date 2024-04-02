import 'package:great_talk/extensions/remote_config_key_extension.dart';

class RemoteConfigConstants {
  static const int appVersion = 222;
  // 一日にできる会話数
  static const freeLimitPerDay = 15;
  static const basicLimitPerDay = 10000;
  static const premiumLimitPerDay = 1000;
  // メンテナンスメッセージ
  static const String maintenanceMsg = "メンテナンス中";
  static const String forcedUpdateMsg = "最新バージョンへのアップデートが必要です。";
  // key
  static const freeLimitPerDayKey = "free_limit_per_day";
  static const basicLimitPerDayKey = "basic_limit_per_day";
  static const premiumLimitPerDayKey = "premium_limit_per_day";
  static final maintenanceModeKey =
      "maintenance_mode".toOsSpecificRemoteConfigKey;
  static final maintenanceMsgKey =
      "maintenance_msg".toOsSpecificRemoteConfigKey;
  static final forcedUpdateVersionKey =
      "forced_update_version".toOsSpecificRemoteConfigKey;
  static final forcedUpdateMsgKey =
      "forced_update_msg".toOsSpecificRemoteConfigKey;
}
