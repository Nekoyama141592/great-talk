import 'dart:async';
import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 生成されるファイルを指定
part 'chatgpt_stream.g.dart'; // your_file_name は実際のファイル名に置き換えてください

@riverpod
Stream<String> chatStream(Ref ref) {
  // StreamControllerを作成
  final controller = StreamController<String>();
  final client = http.Client(); // http.Clientを生成

  Future<void> fetch() async {
    try {
      final url = Uri.parse('http://localhost:3000/api/chat');
      final messages = {
        'messages': [
          {'role': 'system', 'content': '日本語に翻訳するAIです'},
          {'role': 'user', 'content': 'Hello, World'}
        ]
      };
      
      final request = http.Request('POST', url)
        ..headers['Content-Type'] = 'application/json' // Content-Typeを指定
        ..body = json.encode(messages);

      final response = await client.send(request);

      // レスポンスのストリームをリッスン
      response.stream
          .transform(utf8.decoder)
          .listen(
            (chunk) {
              // チャンクデータを処理してStreamに追加
              if (chunk.startsWith('0:')) {
                final result = chunk.replaceAll('0:', '').replaceAll('\n', '').replaceAll('"', '');
                controller.add(result);
              }
            },
            onDone: () {
              // ストリームが完了したらコントローラーを閉じる
              controller.close();
              client.close(); // Clientを閉じる
              print('Stream done.');
            },
            onError: (e, stackTrace) {
              // エラーハンドリング
              print('Stream error: $e');
              controller.addError(e, stackTrace);
              controller.close();
              client.close(); // Clientを閉じる
            }
          );
    } catch (e, stackTrace) {
      print('Fetch error: $e');
      controller.addError(e, stackTrace);
      controller.close();
      client.close(); // Clientを閉じる
    }
  }

  // 非同期処理を開始
  fetch();

  // ref.onDisposeを使って、Providerが破棄されるときにリソースをクリーンアップ
  ref.onDispose(() {
    print('Provider disposed. Closing controller and client.');
    if (!controller.isClosed) {
      controller.close();
    }
    client.close();
  });

  // コントローラーのStreamを返す
  return controller.stream;
}