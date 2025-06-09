import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:great_talk/consts/remote_config_constants.dart';
import 'package:great_talk/model/view_model_state/chat/chat_state.dart';
import 'package:great_talk/providers/global/infrastructure/chat_gpt_sdk/chat_gpt_sdk_client.dart';
import 'package:great_talk/providers/global/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/notifier/purchases/purchases_notifier.dart';
import 'package:great_talk/providers/repository/database/database_repository_provider.dart';
import 'package:great_talk/providers/repository/local/local_repository_provider.dart';
import 'package:great_talk/providers/global/usecase/file/file_use_case_provider.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/consts/chatgpt_contants.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/text_message/text_message.dart';
import 'package:great_talk/ui_core/toast_ui_core.dart';
part 'chat_view_model.g.dart';

@riverpod
class ChatViewModel extends _$ChatViewModel {
  @override
  Future<ChatState> build(String uid, String postId) async {
    // 投稿データを非同期で取得
    final post = await _fetchPost(uid, postId);
    if (post == null) {
      throw Exception('Post with ID $postId not found for user $uid');
    }

    // 投稿画像とローカルのチャット履歴を取得
    final postImage = await _fetchPostImage(post);
    final localMessages = _getLocalMessages(post.postId);

    return ChatState(post: post, postImage: postImage, messages: localMessages);
  }

  /// メッセージ送信ボタンが押されたときの処理
  FutureResult<bool> onSendPressed(
    void Function() unFocus, // or Navigator
    TextEditingController inputController,
    ScrollController scrollController,
  ) async {
    if (!ref.read(purchasesNotifierProvider.notifier).isSubscribing()) {
      return const Result.failure('有料プランに加入する必要があります');
    }
    final text = inputController.text;
    unFocus.call();
    // APIを実行
    return execute(scrollController, text, inputController);
  }

  /// メッセージ送信の実行ロジック
  FutureResult<bool> execute(
    ScrollController scrollController,
    String content,
    TextEditingController inputController,
  ) async {
    final currentState = state.value!;
    if (currentState.isGenerating) {
      return const Result.failure('応答を生成中です');
    }

    // 状態を「生成中」に更新
    state = AsyncData(currentState.copyWith(isGenerating: true));
    // 自分のメッセージをリストに追加
    _addMyMessage(content);
    // AIの返信用の空メッセージをリストに追加
    _addEmptyMessage();
    // UIを一番下にスクロール
    _scrollToBottom(scrollController);

    // リクエストを作成
    final request = _createChatRequest(content);
    inputController.clear();

    // SSEをリッスンし、リアルタイムで状態を更新
    return _listenAndUpdate(request, scrollController);
  }

  /// SSEストリームをリッスンし、状態を更新する
  FutureResult<bool> _listenAndUpdate(
    ChatCompleteText request,
    ScrollController scrollController,
  ) async {
    final client = ref.read(chatGptSdkClientProvider);
    final stream = client
        .onChatCompletionSSE(request: request)
        .transform(
          StreamTransformer.fromHandlers(
            handleError: (err, stackTrace, sink) {
              if (err is OpenAIAuthError) {
                ToastUiCore.showFlutterToast(
                  "OpenAIの認証でエラーが発生しました。運営の対応をお待ちください。",
                );
              }
              if (err is OpenAIRateLimitError) {
                ToastUiCore.showFlutterToast(
                  "RateLimitエラーが発生しました。しばらく待ってからお試しください。",
                );
              }
              if (err is OpenAIServerError) {
                ToastUiCore.showFlutterToast(
                  "OpenAIのサーバーでエラーが発生しました。しばらく待ってからお試しください。",
                );
              }
            },
          ),
        );
    String fullResponse = "";

    try {
      await for (final it in stream) {
        final content =
            ((it as ChatResponseSSE)).choices?.last.message?.content;
        if (content != null && content.isNotEmpty) {
          fullResponse += content;
          state = AsyncData(state.value!.copyWith(realtimeRes: fullResponse));
          _scrollToBottom(scrollController);
        }
      }
      _onSseDone(fullResponse);
      return const Result.success(true);
    } catch (e) {
      _onSseError(e);
      return const Result.failure('エラーが発生しました');
    }
  }

  /// SSEストリームが正常に完了したときの処理
  void _onSseDone(String finalResponse) {
    final currentMessages = [...state.value!.messages];
    // 最後尾の空メッセージを、完成したAIの応答で置き換える
    currentMessages.last = _newTextMessage(
      finalResponse,
      state.value!.post.postId,
    );

    state = AsyncData(
      state.value!.copyWith(
        isGenerating: false,
        messages: currentMessages,
        realtimeRes: "", // リアルタイム応答をクリア
      ),
    );
    _setLocalMessage(); // チャット履歴をローカルに保存
  }

  /// SSEストリームでエラーが発生したときの処理
  void _onSseError(Object error) {
    if (state.value == null) return;

    // 生成に失敗したメッセージ（自分とAIの空メッセージ）を削除
    final currentMessages = List<TextMessage>.from(state.value!.messages);
    if (currentMessages.length >= 2) {
      currentMessages.removeRange(
        currentMessages.length - 2,
        currentMessages.length,
      );
    }
    state = AsyncData(
      state.value!.copyWith(
        isGenerating: false,
        messages: currentMessages,
        realtimeRes: "",
      ),
    );
  }

  Future<Post?> _fetchPost(String uid, String postId) {
    final repository = ref.read(databaseRepositoryProvider);
    return repository.getPost(uid, postId);
  }

  Future<String?> _fetchPostImage(Post post) {
    final detectedImage = post.typedImage();
    return ref
        .read(fileUseCaseProvider)
        .getS3Image(detectedImage.bucketName, detectedImage.value);
  }

  List<TextMessage> _getLocalMessages(String postId) {
    return ref.read(localRepositoryProvider).getMessages(postId);
  }

  void _addMyMessage(String content) {
    final uid = ref.read(streamAuthUidProvider).value;
    if (uid == null) return;
    final textMessage = _newTextMessage(content, uid);
    final newMessages = List<TextMessage>.from(state.value!.messages)
      ..add(textMessage);
    state = AsyncData(state.value!.copyWith(messages: newMessages));
  }

  void _addEmptyMessage() {
    final post = state.value!.post;
    // AIの応答がリアルタイムで入るためのプレースホルダー
    final emptyMessage = _newTextMessage("", post.postId);
    final newMessages = List<TextMessage>.from(state.value!.messages)
      ..add(emptyMessage);
    state = AsyncData(
      state.value!.copyWith(messages: newMessages, realtimeRes: ""),
    );
  }

  ChatCompleteText _createChatRequest(String content) {
    final post = state.value!.post;
    final requestMessages = _toRequestMessages();
    requestMessages.insert(0, _systemMsg(post));
    final model =
        ref.read(purchasesNotifierProvider.notifier).isPremiumSubscribing()
            ? RemoteConfigConstants.premiumModel
            : RemoteConfigConstants.basicModel;
    final uid = ref.read(streamAuthUidProvider).value;

    return ChatCompleteText(
      model: ChatModelFromValue(model: model),
      messages: requestMessages.map((e) => e.toJson()).toList(),
      maxToken: _adjustMaxToken(),
      user: uid,
    );
  }

  List<Messages> _toRequestMessages() {
    final messages = state.value!.messages;
    const maxRequestLength = ChatGPTConstants.maxRequestLength;
    // 最後のメッセージはAIの空応答なので含めない
    final targetMessages = messages.sublist(0, messages.length - 1);
    final history =
        targetMessages.length > maxRequestLength
            ? targetMessages.sublist(targetMessages.length - maxRequestLength)
            : targetMessages;
    return history.map(_toRequestMessage).toList();
  }

  Messages _toRequestMessage(TextMessage msg) {
    final currentUid = ref.read(streamAuthUidProvider).value;
    return Messages(
      role: msg.senderUid == currentUid ? Role.user : Role.assistant,
      content: msg.typedText().value,
    );
  }

  Messages _systemMsg(Post post) {
    final content = post.typedCustomCompleteText().systemPrompt;
    return Messages(role: Role.system, content: content);
  }

  int _adjustMaxToken() {
    const maxRequestLength = ChatGPTConstants.maxRequestLength;
    final maxToken = 4000; // 仮の値
    final result =
        state.value!.messages.length < maxRequestLength
            ? maxToken ~/ (maxRequestLength - 1)
            : maxToken;
    return result.clamp(1, 4096);
  }

  Future<void> _setLocalMessage() async {
    final stateValue = state.value;
    if (stateValue == null) return;
    final postId = stateValue.post.postId;
    await ref
        .read(localRepositoryProvider)
        .setMessages(postId, stateValue.messages);
  }

  TextMessage _newTextMessage(String content, String senderUid) {
    final post = state.value!.post;
    return TextMessage.instance(content, post, senderUid);
  }

  void _scrollToBottom(ScrollController scrollController) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  FutureResult<bool> cleanLocalMessage() async {
    final stateValue = state.value!;
    final messages = stateValue.messages;

    state = AsyncData(stateValue.copyWith(messages: messages));

    return await ref.read(localRepositoryProvider).removeChatLog(postId);
  }
}
