import 'package:great_talk/core/provider/repository/api/api_repository_provider.dart';
import 'package:great_talk/core/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/application/use_case/post/delete_post_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_post_use_case_provider.g.dart';

@riverpod
DeletePostUseCase deletePostUseCase(Ref ref) => DeletePostUseCase(
  firestoreRepository: ref.watch(databaseRepositoryProvider),
  apiRepository: ref.watch(apiRepositoryProvider),
);
