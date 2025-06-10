import 'package:great_talk/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/use_case/post_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_use_case_provider.g.dart';

@riverpod
PostUseCase postUsecase(Ref ref) =>
    PostUseCase(firestoreRepository: ref.watch(databaseRepositoryProvider));
