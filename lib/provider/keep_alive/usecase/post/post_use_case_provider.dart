import 'package:great_talk/provider/repository/api/api_repository_provider.dart';
import 'package:great_talk/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/application/use_case/post/mute_post_use_case.dart';
import 'package:great_talk/application/use_case/post/mute_user_use_case.dart';
import 'package:great_talk/application/use_case/post/like_post_use_case.dart';
import 'package:great_talk/application/use_case/post/delete_post_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_use_case_provider.g.dart';

@riverpod
MutePostUseCase mutePostUseCase(Ref ref) => MutePostUseCase(
  firestoreRepository: ref.watch(databaseRepositoryProvider),
);

@riverpod
MuteUserUseCase muteUserUseCase(Ref ref) => MuteUserUseCase(
  firestoreRepository: ref.watch(databaseRepositoryProvider),
);

@riverpod
LikePostUseCase likePostUseCase(Ref ref) => LikePostUseCase(
  firestoreRepository: ref.watch(databaseRepositoryProvider),
);

@riverpod
DeletePostUseCase deletePostUseCase(Ref ref) => DeletePostUseCase(
  firestoreRepository: ref.watch(databaseRepositoryProvider),
  apiRepository: ref.watch(apiRepositoryProvider),
);
