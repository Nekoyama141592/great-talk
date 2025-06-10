import 'package:great_talk/provider/keep_alive/infrastructure/firebase/firebase_functions/firebase_functions_provider.dart';
import 'package:great_talk/repository/api_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_repository_provider.g.dart';

@riverpod
ApiRepository apiRepository(Ref ref) =>
    ApiRepository(ref.read(firebaseFunctionsProvider));
