import 'package:great_talk/core/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/application/use_case/post/mute_post_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mute_post_use_case_provider.g.dart';

@riverpod
MutePostUseCase mutePostUseCase(Ref ref) =>
    MutePostUseCase(firestoreRepository: ref.watch(databaseRepositoryProvider));
