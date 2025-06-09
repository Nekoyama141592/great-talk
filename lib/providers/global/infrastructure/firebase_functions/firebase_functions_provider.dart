import 'package:cloud_functions/cloud_functions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_functions_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseFunctions firebaseFunctions(Ref ref) => FirebaseFunctions.instanceFor(region: 'asia-northeast1');