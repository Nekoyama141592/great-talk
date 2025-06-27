import 'package:great_talk/core/provider/keep_alive/infrastructure/firebase/firebase_remote_config/firebase_remote_config_provider.dart';
import 'package:great_talk/infrastructure/repository/remote_config_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config_repository_provider.g.dart';

@riverpod
RemoteConfigRepository remoteConfigRepository(Ref ref) =>
    RemoteConfigRepository(ref.watch(firebaseRemoteConfigProvider));
