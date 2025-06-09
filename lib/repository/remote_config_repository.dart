import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:great_talk/consts/remote_config_constants.dart';

class RemoteConfigRepository {
  RemoteConfigRepository(this.instance);
  final FirebaseRemoteConfig instance;
  String get _maintenanceModeKey => RemoteConfigConstants.maintenanceModeKey;
  String get _maintenanceMsgKey => RemoteConfigConstants.maintenanceMsgKey;
  String get _forcedUpdateVersionKey =>
      RemoteConfigConstants.forcedUpdateVersionKey;
  String get _forcedUpdateMsgKey => RemoteConfigConstants.forcedUpdateMsgKey;
  String get _basicModelKey => RemoteConfigConstants.basicModelKey;
  String get _premiumModelKey => RemoteConfigConstants.premiumModelKey;

  Future<void> _setConfigSettings() {
    return instance.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(seconds: 15),
      ),
    );
  }

  Future<void> _setDefaults() {
    return instance.setDefaults({
      _maintenanceModeKey: false,
      _maintenanceMsgKey: RemoteConfigConstants.maintenanceMsg,
      _forcedUpdateVersionKey: RemoteConfigConstants.appVersion,
      _forcedUpdateMsgKey: RemoteConfigConstants.forcedUpdateMsg,
      _basicModelKey: RemoteConfigConstants.basicModel,
      _premiumModelKey: RemoteConfigConstants.premiumModel,
    });
  }

  Future<void> init() {
    return Future.wait([_setConfigSettings(), _setDefaults()]);
  }

  Future<bool> fetchAndActivate() {
    return instance.fetchAndActivate();
  }

  bool getMaintenanceMode() => instance.getBool(_maintenanceModeKey);
  String getMaintenanceMsg() => instance.getString(_maintenanceMsgKey);
  int getForcedUpdateVersion() => instance.getInt(_forcedUpdateVersionKey);
  String getForcedUpdateMsg() => instance.getString(_forcedUpdateMsgKey);
  String getBasicModel() => instance.getString(_basicModelKey);
  String getPremiumModel() => instance.getString(_premiumModelKey);
}
