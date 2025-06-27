import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'prefs_provider.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences prefs(Ref ref) => throw UnimplementedError();
