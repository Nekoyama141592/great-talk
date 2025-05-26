import 'dart:async';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:great_talk/infrastructure/chat_gpt_sdk_client.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 生成されるファイルを指定
part 'chat_completion_sse.g.dart'; // your_file_name は実際のファイル名に置き換えてください

@riverpod
Stream<String> chatCompletionSse(Ref ref, {required ChatCompleteText request}) {
  final client = ChatGptSdkClient();
  return client.openAI
      .onChatCompletionSSE(request: request)
      .transform(
        StreamTransformer.fromHandlers(
          handleError: (err, stackTrace, sink) {
            if (err is OpenAIAuthError) {
              UIHelper.showFlutterToast("OpenAIの認証でエラーが発生しました。運営の対応をお待ちください。");
            }
            if (err is OpenAIRateLimitError) {
              UIHelper.showFlutterToast(
                "RateLimitエラーが発生しました。しばらく待ってからお試しください。",
              );
            }
            if (err is OpenAIServerError) {
              UIHelper.showFlutterToast(
                "OpenAIのサーバーでエラーが発生しました。しばらく待ってからお試しください。",
              );
            }
          },
        ),
      );
}
