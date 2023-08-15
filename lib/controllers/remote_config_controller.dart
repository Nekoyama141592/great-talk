import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/controllers/once_init_controller.dart';
import 'package:great_talk/extensions/remote_config_key_extension.dart';

class RemoteConfigController extends OnceInitController {
  static RemoteConfigController get to => Get.find<RemoteConfigController>();
  // iosとAndroidで分ける
  final maintenanceMode = false.obs;
  final maintenanceMsg = defaultMaintenanceMsg.obs;
  final forcedUpdateVersion = appVersion.obs;
  final forcedUpdateMsg = defaultForcedUpdateMsg.obs;

  bool needsUpdate() => appVersion < forcedUpdateVersion.value;

  @override
  Future<void> fetchData() async {
    // インスタンスの作成
    final remoteConfig = FirebaseRemoteConfig.instance;

    // シングルトンオブジェクトの取得
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(seconds: 15),
    ));
    // keyの設定
    final maintenanceModeKey = "maintenance_mode".toOsSpecificRemoteConfigKey();
    final maintenanceMsgKey = "maintenance_msg".toOsSpecificRemoteConfigKey();
    final forcedUpdateVersionKey =
        "forced_update_version".toOsSpecificRemoteConfigKey();
    final forcedUpdateMsgKey =
        "forced_update_msg".toOsSpecificRemoteConfigKey();

    // アプリ内デフォルトパラメータ値の設定
    await remoteConfig.setDefaults({
      maintenanceModeKey: false,
      maintenanceMsgKey: defaultMaintenanceMsg,
      forcedUpdateVersionKey: appVersion,
      forcedUpdateMsgKey: defaultForcedUpdateMsg,
    });

    // 値をフェッチ
    await remoteConfig.fetchAndActivate();
    maintenanceMode(remoteConfig.getBool(maintenanceModeKey)); // メンテナンス中かどうかを判定
    // メンテナンス中なら表示するメッセージを取得
    if (maintenanceMode.value) {
      maintenanceMsg(remoteConfig.getString(maintenanceMsgKey));
    }
    forcedUpdateVersion(
        remoteConfig.getInt(forcedUpdateVersionKey)); // 強制アップデートが必要なバージョンを取得
    // 強制アップデートが必要なら表示するメッセージを表示
    if (needsUpdate()) {
      forcedUpdateMsg(remoteConfig.getString(forcedUpdateMsgKey));
    }
  }
}
