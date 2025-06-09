import 'package:great_talk/providers/global/usecase/file/file_use_case_provider.dart';
import 'package:great_talk/use_case/user_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_use_case_provider.g.dart';

@riverpod
UserUseCase userUseCase(Ref ref) => UserUseCase(ref.watch(fileUseCaseProvider));
