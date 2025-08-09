import 'package:great_talk/application/use_case/user/user_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_use_case_provider.g.dart';

@riverpod
UserUseCase userUseCase(Ref ref) => UserUseCase();
