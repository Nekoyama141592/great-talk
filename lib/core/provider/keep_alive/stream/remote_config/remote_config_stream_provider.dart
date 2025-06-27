import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:great_talk/core/provider/keep_alive/infrastructure/firebase/firebase_remote_config/firebase_remote_config_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config_stream_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<RemoteConfigUpdate> remoteConfigStream(Ref ref) =>
    ref.watch(firebaseRemoteConfigProvider).onConfigUpdated;
