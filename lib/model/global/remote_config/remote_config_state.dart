import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/remote_config_constants.dart';

part 'remote_config_state.freezed.dart';
part 'remote_config_state.g.dart';

@freezed
abstract class RemoteConfigState with _$RemoteConfigState {
  const RemoteConfigState._();
  const factory RemoteConfigState({
    @Default(false) bool maintenanceMode,
    @Default('') String maintenanceMsg,
    @Default(0) int forcedUpdateVersion,
    @Default('') String forcedUpdateMsg,
    @Default('') String basicModel,
    @Default('') String premiumModel,
  }) = _RemoteConfigState;
  factory RemoteConfigState.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigStateFromJson(json);
  bool get needsUpdate =>
      RemoteConfigConstants.appVersion < forcedUpdateVersion;
}
