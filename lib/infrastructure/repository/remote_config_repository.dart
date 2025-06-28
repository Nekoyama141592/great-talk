import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:great_talk/presentation/constant/remote_config_constants.dart';
import 'package:great_talk/core/util/remote_config_core.dart';
import 'package:great_talk/domain/repository_interface/i_remote_config_repository.dart';

class RemoteConfigRepository implements IRemoteConfigRepository {
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

  @override
  Future<void> init() {
    return Future.wait([_setConfigSettings(), _setDefaults()]);
  }

  @override
  Future<bool> fetchAndActivate() {
    return instance.fetchAndActivate();
  }

  @override
  String getMaintenanceMsg() => instance.getString(_maintenanceMsgKey);
  @override
  int getForcedUpdateVersion() => instance.getInt(_forcedUpdateVersionKey);
}
