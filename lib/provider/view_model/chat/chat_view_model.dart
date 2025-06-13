import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:great_talk/model/view_model_state/chat/chat_state.dart';
import 'package:great_talk/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/provider/keep_alive/notifier/purchases/purchases_notifier.dart';
import 'package:great_talk/provider/repository/api/api_repository_provider.dart';
import 'package:great_talk/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/provider/repository/local/local_repository_provider.dart';
import 'package:great_talk/provider/keep_alive/usecase/file/file_use_case_provider.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/text_message/text_message.dart';
part 'chat_view_model.g.dart';

@riverpod
class ChatViewModel extends _$ChatViewModel {
  @override
  Future<ChatState> build(String uid, String postId) async {
    // 投稿データを非同期で取得
    final post = await _fetchPost(uid, postId);
    if (post == null) {
      throw Exception('情報が取得できませんでした');
    }
    // 投稿画像とローカルのチャット履歴を取得
    final postImage = await _fetchPostImage(post);
    final localMessages = _getLocalMessages(post.postId);

    return ChatState(post: post, postImage: postImage, messages: localMessages);
  }

  /// メッセージ送信ボタンが押されたときの処理
  FutureResult<Map<String,dynamic>?>  onSendPressed(
    String text,
    ScrollController scrollController,
  ) async {
    final isSubscribing = ref.read(purchasesNotifierProvider).value?.isSubscribing() ?? false;
    if (!isSubscribing) {
      return const Result.failure('有料プランに加入する必要があります');
    }
    // APIを実行
    return execute(scrollController,text);
  }

  /// メッセージ送信の実行ロジック
  FutureResult<Map<String,dynamic>?> execute(
    ScrollController scrollController,
    String content,
  ) async {
    final currentState = state.value!;
    if (currentState.isGenerating) {
      return const Result.failure('応答を生成中です');
    }

    // 状態を「生成中」に更新
    state = AsyncData(currentState.copyWith(isGenerating: true));
    // 自分のメッセージをリストに追加
    _addMyMessage(content);
    // UIを一番下にスクロール
    _scrollToBottom(scrollController);

    return ref.read(apiRepositoryProvider).generateText();
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

  Future<void> onSuccess() async {
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

  FutureResult<bool> cleanLocalMessage() {
    final stateValue = state.value!;
    final messages = stateValue.messages;

    state = AsyncData(stateValue.copyWith(messages: messages));

    return ref.read(localRepositoryProvider).removeChatLog(postId);
  }
}
