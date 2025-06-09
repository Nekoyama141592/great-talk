import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_remote_config_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseRemoteConfig firebaseRemoteConfig(Ref ref) => FirebaseRemoteConfig.instance;