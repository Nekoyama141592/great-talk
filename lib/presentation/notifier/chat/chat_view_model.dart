import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:great_talk/core/util/chat_util.dart';
import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_text/request/message/generate_text_request_message.dart';
import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_text/response/generate_text_response.dart';
import 'package:great_talk/presentation/state/chat/chat_state.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/presentation/notifier/purchases/purchases_notifier.dart';
import 'package:great_talk/core/provider/repository/api/api_repository_provider.dart';
import 'package:great_talk/core/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/core/provider/repository/local/local_repository_provider.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/infrastructure/model/local_schema/text_message/text_message.dart';
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
    final localMessages = _getLocalMessages(post.postId);
    final messages =
        localMessages.isEmpty
            ? [TextMessage.assistant(post.description.value, post)]
            : localMessages;
    return ChatState(post: post, messages: messages);
  }

  /// メッセージ送信ボタンが押されたときの処理
  FutureResult<GenerateTextResponse> onSendPressed(
    String text,
    ScrollController scrollController,
  ) async {
    if (state.isLoading) {
      return const Result.failure('ロード中です');
    }
    return execute(scrollController, text);
  }

  void startLoading() {
    state = const AsyncValue.loading();
  }

  FutureResult<GenerateTextResponse> execute(
    ScrollController scrollController,
    String content,
  ) async {
    final purchaseState = ref.read(purchasesNotifierProvider);
    final isPremiumActive = purchaseState.value?.isPremiumActive ?? false;
    final isProActive = purchaseState.value?.isProActive ?? false;
    if (!isPremiumActive && !isProActive) {
      return const Result.failure('有料プランに登録してください');
    }
    final messages = _addMyMessage(content);
    // UIを一番下にスクロール
    _scrollToBottom(scrollController);
    final requestMessages =
        messages.map((e) {
            final role = e.role(postId);
            return GenerateTextRequestMessage(
              role: role,
              content: e.text.value,
            );
          }).toList()
          ..insert(
            0,
            GenerateTextRequestMessage.system(
              state.value!.post.description.value,
            ),
          );
    final model = ChatUtil.model(
      isPremiumActive: isPremiumActive,
      isProActive: isProActive,
    );
    final messagesJson = requestMessages.map((e) => e.toJson()).toList();
    final oldState = state.value!;
    state = const AsyncValue.loading();
    final result = await ref
        .read(apiRepositoryProvider)
        .generateText(model, messagesJson);
    state = AsyncData(oldState);
    return result;
  }

  Future<PostEntity?> _fetchPost(String uid, String postId) {
    final repository = ref.read(databaseRepositoryProvider);
    return repository.getPost(uid, postId);
  }

  List<TextMessage> _getLocalMessages(String postId) {
    return ref.read(localRepositoryProvider).getMessages(postId);
  }

  List<TextMessage> _addMyMessage(String content) {
    final uid = ref.read(authUidProvider);
    if (uid == null) return state.value!.messages;
    final textMessage = TextMessage.user(content, uid);
    final newMessages = List<TextMessage>.from(state.value!.messages)
      ..add(textMessage);
    state = AsyncData(state.value!.copyWith(messages: newMessages));
    return newMessages;
  }

  Future<void> onSuccess(GenerateTextResponse res) async {
    final currentUid = ref.read(authUidProvider);
    if (currentUid == null) return;
    final stateValue = state.value!;
    final post = stateValue.post;
    final postId = post.postId;
    final newMessage = TextMessage.assistant(res.content, post);
    final newMessages = [...stateValue.messages, newMessage];
    state = AsyncData(stateValue.copyWith(messages: newMessages));
    return ref.read(localRepositoryProvider).setMessages(postId, newMessages);
  }

  void onFailure() {
    final stateValue = state.value!;
    final newMessages = [...stateValue.messages]..removeLast();
    state = AsyncData(stateValue.copyWith(messages: newMessages));
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
    state = AsyncData(stateValue.copyWith(messages: []));

    return ref.read(localRepositoryProvider).removeChatLog(postId);
  }
}
