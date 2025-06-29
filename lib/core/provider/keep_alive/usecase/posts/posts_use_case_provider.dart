import 'package:great_talk/core/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/core/provider/keep_alive/usecase/file/file_use_case_provider.dart';
import 'package:great_talk/application/use_case/posts/posts_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'posts_use_case_provider.g.dart';

@riverpod
PostsUseCase postsUseCase(Ref ref) => PostsUseCase(
  repository: ref.watch(databaseRepositoryProvider),
  fileUseCase: ref.watch(fileUseCaseProvider),
);
