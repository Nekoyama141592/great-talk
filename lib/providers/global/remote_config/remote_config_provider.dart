import 'package:great_talk/model/global/remote_config/remote_config_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:great_talk/consts/remote_config_constants.dart';

part 'remote_config_provider.g.dart';

@Riverpod(keepAlive: true)
class RemoteConfigNotifier extends _$RemoteConfigNotifier {
  @override
  FutureOr<RemoteConfigState> build() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(seconds: 15),
      ),
    );

    // キーの設定
    final maintenanceModeKey = RemoteConfigConstants.maintenanceModeKey;
    final maintenanceMsgKey = RemoteConfigConstants.maintenanceMsgKey;
    final forcedUpdateVersionKey = RemoteConfigConstants.forcedUpdateVersionKey;
    final forcedUpdateMsgKey = RemoteConfigConstants.forcedUpdateMsgKey;
    const basicModelKey = RemoteConfigConstants.basicModelKey;
    const premiumModelKey = RemoteConfigConstants.premiumModelKey;

    await remoteConfig.setDefaults({
      maintenanceModeKey: false,
      maintenanceMsgKey: RemoteConfigConstants.maintenanceMsg,
      forcedUpdateVersionKey: RemoteConfigConstants.appVersion,
      forcedUpdateMsgKey: RemoteConfigConstants.forcedUpdateMsg,
      basicModelKey: RemoteConfigConstants.basicModel,
      premiumModelKey: RemoteConfigConstants.premiumModel,
    });

    await remoteConfig.fetchAndActivate();

    final maintenanceMode = remoteConfig.getBool(maintenanceModeKey);
    final maintenanceMsg =
        maintenanceMode
            ? remoteConfig.getString(maintenanceMsgKey)
            : RemoteConfigConstants.maintenanceMsg;
    final forcedUpdateVersion = remoteConfig.getInt(forcedUpdateVersionKey);
    final forcedUpdateMsg =
        (RemoteConfigConstants.appVersion < forcedUpdateVersion)
            ? remoteConfig.getString(forcedUpdateMsgKey)
            : RemoteConfigConstants.forcedUpdateMsg;
    final basicModel = remoteConfig.getString(basicModelKey);
    final premiumModel = remoteConfig.getString(premiumModelKey);

    return RemoteConfigState(
      maintenanceMode: maintenanceMode,
      maintenanceMsg: maintenanceMsg,
      forcedUpdateVersion: forcedUpdateVersion,
      forcedUpdateMsg: forcedUpdateMsg,
      basicModel: basicModel,
      premiumModel: premiumModel,
    );
  }
}
