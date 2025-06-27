import 'package:great_talk/provider/repository/api/api_repository_provider.dart';
import 'package:great_talk/provider/repository/local/local_repository_provider.dart';
import 'package:great_talk/application/use_case/file/file_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'file_use_case_provider.g.dart';

@riverpod
FileUseCase fileUseCase(Ref ref) => FileUseCase(
  localRepository: ref.watch(localRepositoryProvider),
  repository: ref.watch(apiRepositoryProvider),
);
