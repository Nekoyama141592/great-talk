import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_talk/consts/env_keys.dart';

class ChatGptApiClient {
  ChatGptApiClient() {
    openAI = OpenAI.instance.build(
        token: dotenv.get(EnvKeys.OPEN_AI_API_KEY.name),
        baseOption: HttpSetup(
            receiveTimeout: const Duration(seconds: 20),
            connectTimeout: const Duration(seconds: 20)),
        enableLog: true);
  }
  late OpenAI openAI;
}
