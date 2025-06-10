import 'package:great_talk/infrastructure/open_ai/open_ai_client.dart';
import 'package:great_talk/infrastructure/original_dio.dart';
import 'package:great_talk/core/env_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'open_ai_client_provider.g.dart';

@Riverpod(keepAlive: true)
OpenAIClient openAIClient(Ref ref) => OpenAIClient(
  OriginalDio.withOptions(
    baseUrl: "https://api.openai.com/v1",
    token: EnvCore().openAiApiKey,
  ),
);
