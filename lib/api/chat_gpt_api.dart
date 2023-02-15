// packages
import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatGPTApi {
  static const maxTokens = 1000;
  static Future<String> fetchApi(String prompt) async {
    final chatGpt = ChatGpt(apiKey: dotenv.get("OPEN_AI_API_KEY")); 
    final request = CompletionRequest(
      prompt: prompt,
      maxTokens: maxTokens,
      model: ChatGptModel.textDavinci003.key,
    );
    return await chatGpt.createCompletion(request) ?? "返答が取得できませんでした";
  }
}