import 'package:great_talk/infrastructure/repository/local_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/core/provider/overrides/prefs/prefs_provider.dart';
part 'local_repository_provider.g.dart';

@riverpod
LocalRepository localRepository(Ref ref) =>
    LocalRepository(ref.read(prefsProvider));
