import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:great_talk/utility/env_utility.dart';

class ChatGptSdkClient {
  ChatGptSdkClient() {
    openAI = OpenAI.instance.build(
        token: EnvUtility.openAiApiKey,
        baseOption: HttpSetup(
            receiveTimeout: const Duration(seconds: 20),
            connectTimeout: const Duration(seconds: 20)),
        enableLog: true);
  }
  late OpenAI openAI;
}
