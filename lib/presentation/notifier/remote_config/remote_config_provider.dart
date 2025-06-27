import 'package:great_talk/presentation/state/remote_config/remote_config_state.dart';
import 'package:great_talk/provider/keep_alive/stream/remote_config/remote_config_stream_provider.dart';
import 'package:great_talk/provider/repository/remote_config/remote_config_repository_provider.dart';
import 'package:great_talk/infrastructure/repository/remote_config_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config_provider.g.dart';

@Riverpod(keepAlive: true)
class RemoteConfigNotifier extends _$RemoteConfigNotifier {
  RemoteConfigRepository get _repository =>
      ref.watch(remoteConfigRepositoryProvider);
  @override
  FutureOr<RemoteConfigState> build() async {
    await _repository.init();
    ref.watch(remoteConfigStreamProvider).value;
    await _repository.fetchAndActivate();
    return _getState();
  }

  RemoteConfigState _getState() {
    return RemoteConfigState(
      maintenanceMsg: _repository.getMaintenanceMsg(),
      forcedUpdateVersion: _repository.getForcedUpdateVersion(),
    );
  }
}
