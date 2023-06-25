import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/env_keys.dart';

class RealtimeResController extends GetxController {
  final messages = [].obs;
  final realtimeRes = "".obs;
  late OpenAI openAI;
  @override
  void onInit() {
    openAI = OpenAI.instance.build(
        token: dotenv.get(EnvKeys.OPEN_AI_API_KEY.name),
        baseOption: HttpSetup(
            receiveTimeout: const Duration(seconds: 20),
            connectTimeout: const Duration(seconds: 20)),
        enableLog: true);
    super.onInit();
  }

  void execute() async {
    final model = GptTurboChatModel();
    final request = ChatCompleteText(messages: [
      Messages(
          role: Role.user, content: '二週間後に数学のテストがあります。どのようにして勉強をすすめればいいですか？')
    ], maxToken: 200, model: model);
    messages.add("");
    realtimeRes("");
    messages([...messages]);
    openAI.onChatCompletionSSE(request: request).listen((it) {
      final content = it.choices?.last.message?.content;
      if (content != null && content.isNotEmpty) {
        realtimeRes(realtimeRes.value + content);
        debugPrint(content);
      }
    },onDone: () {
      messages.last = realtimeRes.value;
      messages([...messages]);
    });
  }
}
