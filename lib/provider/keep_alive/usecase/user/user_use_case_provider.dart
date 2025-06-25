import 'package:great_talk/provider/keep_alive/usecase/file/file_use_case_provider.dart';
import 'package:great_talk/application/use_case/user/user_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_use_case_provider.g.dart';

@riverpod
UserUseCase userUseCase(Ref ref) => UserUseCase(ref.watch(fileUseCaseProvider));
