import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:great_talk/core/env_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chat_gpt_sdk_client.g.dart';

@riverpod
OpenAI chatGptSdkClient(Ref ref) {
  return OpenAI.instance.build(
    token: EnvCore().openAiApiKey,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 30),
    ),
    enableLog: true,
  );
}
