import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:great_talk/consts/ui/remote_config_constants.dart';
import 'package:great_talk/core/util/remote_config_core.dart';

class RemoteConfigRepository {
  RemoteConfigRepository(this.instance);
  final FirebaseRemoteConfig instance;
  String get _maintenanceMsgKey => RemoteConfigCore.maintenanceMsgKey;
  String get _forcedUpdateVersionKey => RemoteConfigCore.forcedUpdateVersionKey;

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
      _maintenanceMsgKey: RemoteConfigConstants.maintenanceMsg,
      _forcedUpdateVersionKey: RemoteConfigConstants.appVersion,
    });
  }

  Future<void> init() {
    return Future.wait([_setConfigSettings(), _setDefaults()]);
  }

  Future<bool> fetchAndActivate() {
    return instance.fetchAndActivate();
  }

  String getMaintenanceMsg() => instance.getString(_maintenanceMsgKey);
  int getForcedUpdateVersion() => instance.getInt(_forcedUpdateVersionKey);
}
