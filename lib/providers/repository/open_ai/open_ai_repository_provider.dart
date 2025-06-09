import 'package:great_talk/repository/open_ai_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/providers/global/infrastructure/open_ai/open_ai_client_provider.dart';

part 'open_ai_repository_provider.g.dart';

@riverpod
OpenAIRepository openAIRepository(Ref ref) =>
    OpenAIRepository(ref.read(openAIClientProvider));