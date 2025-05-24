import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/remote_config_constants.dart';

class RemoteConfigController extends GetxController {
  static RemoteConfigController get to => Get.find<RemoteConfigController>();
  // iosとAndroidで分ける
  final maintenanceMode = false.obs;
  final maintenanceMsg = RemoteConfigConstants.maintenanceMsg.obs;
  final forcedUpdateVersion = RemoteConfigConstants.appVersion.obs;
  final forcedUpdateMsg = RemoteConfigConstants.forcedUpdateMsg.obs;
  bool get needsUpdate =>
      RemoteConfigConstants.appVersion < forcedUpdateVersion.value;
  @override
  void onInit() async {
    // インスタンスの作成
    final remoteConfig = FirebaseRemoteConfig.instance;

    // シングルトンオブジェクトの取得
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(seconds: 15),
    ));
    // keyの設定
    // メンテナンス
    final maintenanceModeKey = RemoteConfigConstants.maintenanceModeKey;
    final maintenanceMsgKey = RemoteConfigConstants.maintenanceMsgKey;
    final forcedUpdateVersionKey = RemoteConfigConstants.forcedUpdateVersionKey;
    final forcedUpdateMsgKey = RemoteConfigConstants.forcedUpdateMsgKey;
    // chatGpt
    const basicModelKey = RemoteConfigConstants.basicModelKey;
    const premiumModelKey = RemoteConfigConstants.premiumModelKey;
    // アプリ内デフォルトパラメータ値の設定
    await remoteConfig.setDefaults({
      maintenanceModeKey: false,
      maintenanceMsgKey: RemoteConfigConstants.maintenanceMsg,
      forcedUpdateVersionKey: RemoteConfigConstants.appVersion,
      forcedUpdateMsgKey: RemoteConfigConstants.forcedUpdateMsg,
      basicModelKey: RemoteConfigConstants.basicModel,
      premiumModelKey: RemoteConfigConstants.premiumModel
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
    if (needsUpdate) {
      forcedUpdateMsg(remoteConfig.getString(forcedUpdateMsgKey));
    }
    super.onInit();
  }
}
