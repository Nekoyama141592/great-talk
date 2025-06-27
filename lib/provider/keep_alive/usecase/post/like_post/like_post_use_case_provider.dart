import 'package:great_talk/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/application/use_case/post/like_post_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_post_use_case_provider.g.dart';

@riverpod
LikePostUseCase likePostUseCase(Ref ref) =>
    LikePostUseCase(firestoreRepository: ref.watch(databaseRepositoryProvider));
