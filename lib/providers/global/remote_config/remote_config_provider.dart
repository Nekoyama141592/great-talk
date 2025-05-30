import 'dart:async';

import 'package:great_talk/model/global/remote_config/remote_config_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:great_talk/consts/remote_config_constants.dart';

part 'remote_config_provider.g.dart';

@Riverpod(keepAlive: true)
class RemoteConfigNotifier extends _$RemoteConfigNotifier {
  late StreamSubscription<RemoteConfigUpdate> _subscription;
  FirebaseRemoteConfig _getConfig() => FirebaseRemoteConfig.instance;
  // キーの設定をprivateなgetterに変更
  String get _maintenanceModeKey => RemoteConfigConstants.maintenanceModeKey;
  String get _maintenanceMsgKey => RemoteConfigConstants.maintenanceMsgKey;
  String get _forcedUpdateVersionKey => RemoteConfigConstants.forcedUpdateVersionKey;
  String get _forcedUpdateMsgKey => RemoteConfigConstants.forcedUpdateMsgKey;
  String get _basicModelKey => RemoteConfigConstants.basicModelKey;
  String get _premiumModelKey => RemoteConfigConstants.premiumModelKey;
  @override
  FutureOr<RemoteConfigState> build() async {
    final remoteConfig = _getConfig();
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(seconds: 15),
      ),
    );


    await remoteConfig.setDefaults({
      _maintenanceModeKey: false,
      _maintenanceMsgKey: RemoteConfigConstants.maintenanceMsg,
      _forcedUpdateVersionKey: RemoteConfigConstants.appVersion,
      _forcedUpdateMsgKey: RemoteConfigConstants.forcedUpdateMsg,
      _basicModelKey: RemoteConfigConstants.basicModel,
      _premiumModelKey: RemoteConfigConstants.premiumModel,
    });

    await remoteConfig.fetchAndActivate();
    _subscription = _getSubscription(remoteConfig);
    ref.onDispose(_subscription.cancel);
    return _getState(remoteConfig);
  }
  StreamSubscription<RemoteConfigUpdate> _getSubscription(FirebaseRemoteConfig remoteConfig) {
    return remoteConfig.onConfigUpdated.listen((RemoteConfigUpdate update) async {
      state = await AsyncValue.guard(() async {
        await remoteConfig.activate();
        return _getState(remoteConfig);
      });
    });
  }

  RemoteConfigState _getState(FirebaseRemoteConfig remoteConfig) {
    return RemoteConfigState(
      maintenanceMode: remoteConfig.getBool(_maintenanceModeKey),
      maintenanceMsg: remoteConfig.getString(_maintenanceMsgKey),
      forcedUpdateVersion: remoteConfig.getInt(_forcedUpdateVersionKey),
      forcedUpdateMsg: remoteConfig.getString(_forcedUpdateMsgKey),
      basicModel: remoteConfig.getString(_basicModelKey),
      premiumModel: remoteConfig.getString(_premiumModelKey),
    );
  }
  
}