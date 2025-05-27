import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/consts/remote_config_constants.dart';
import 'package:great_talk/extensions/number_format_extension.dart';
import 'package:great_talk/infrastructure/chat_gpt_sdk_client.dart';
import 'package:great_talk/model/database_schema/bookmark/bookmark.dart';
import 'package:great_talk/model/database_schema/bookmark_category/bookmark_category.dart';
import 'package:great_talk/model/local_schema/save_text_msg/save_text_msg.dart';
import 'package:great_talk/model/view_model_state/chat/chat_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/providers/logic/post_logic.dart';
import 'package:great_talk/providers/overrides/prefs_provider.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/views/bookmark_categories_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/consts/chatgpt_contants.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/model/database_schema/detected_text/detected_text.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/text_message/text_message.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/views/chat/components/bookmark_categories_list_view.dart';
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
    final localMessages = await _getLocalMessages(post.postId);

    // 初期状態を生成
    final initialState = ChatState(
      post: post,
      postImage: postImage != null ? base64Encode(postImage) : null,
      messages: localMessages,
    );
    // 初回メッセージ（説明文）が必要な場合は追加して状態を更新
    return _processDescriptionMessage(initialState);
  }

  /// メッセージ送信ボタンが押されたときの処理
  Future<void> onSendPressed(
    BuildContext context, // or Navigator
    TextEditingController inputController,
    ScrollController scrollController,
  ) async {
    final text = inputController.text;
    if (text.isEmpty || text.length > FormConsts.maxMessageLimit) {
      UIHelper.showErrorFlutterToast(
        "メッセージは1文字以上、${FormConsts.maxMessageLimit}文字以内で入力してください。",
      );
      return;
    }
    FocusScope.of(context).unfocus();

    // TODO: 元のControllerにあった利用制限チェックをここに実装
    // final chatCountToday = await getChatCount();
    // if (isLimitExceeded(chatCountToday)) {
    //   // サブスクページに遷移させるなどの処理
    //   return;
    // }

    // APIを実行
    await execute(scrollController, text, inputController);
  }

  /// メッセージ送信の実行ロジック
  Future<void> execute(
    ScrollController scrollController,
    String content,
    TextEditingController inputController,
  ) async {
    // state.valueはAsyncValue<ChatState>なので、.valueで中身を取り出す
    final currentState = state.value;
    if (currentState == null || currentState.isGenerating) return;

    // 状態を「生成中」に更新
    state = AsyncData(currentState.copyWith(isGenerating: true));

    // チャット回数などを更新
    // await _setValues();

    // 自分のメッセージをリストに追加
    _addMyMessage(content);
    // AIの返信用の空メッセージをリストに追加
    _addEmptyMessage();
    // UIを一番下にスクロール
    _scrollToBottom(scrollController);

    // リクエストを作成
    final request = await _createChatRequest(content);
    inputController.clear();

    // SSEをリッスンし、リアルタイムで状態を更新
    await _listenAndUpdate(request, scrollController);
  }

  /// SSEストリームをリッスンし、状態を更新する
  Future<void> _listenAndUpdate(
    ChatCompleteText request,
    ScrollController scrollController,
  ) async {
    final client = ChatGptSdkClient();
    final stream = client.openAI
        .onChatCompletionSSE(request: request)
        .transform(
          StreamTransformer.fromHandlers(
            handleError: (err, stackTrace, sink) {
              if (err is OpenAIAuthError) {
                UIHelper.showFlutterToast(
                  "OpenAIの認証でエラーが発生しました。運営の対応をお待ちください。",
                );
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
    } catch (e) {
      _onSseError(e);
      UIHelper.showErrorFlutterToast("エラーが発生しました: $e");
    }
  }

  /// SSEストリームが正常に完了したときの処理
  void _onSseDone(String finalResponse) {
    if (state.value == null) return;
    final currentMessages = List<TextMessage>.from(state.value!.messages);
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
    // await setChatCount(false); // チャット回数を元に戻す場合

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

  /// チャット履歴をクリアする
  Future<void> cleanLocalMessage() async {
    final currentState = state.value;
    if (currentState == null || currentState.messages.isEmpty) return;

    // メッセージリストを空にする
    state = AsyncData(currentState.copyWith(messages: []));
    await ref.read(prefsProvider).remove(currentState.post.postId);
    UIHelper.showFlutterToast(clearChatMsg);

    // 説明メッセージを再追加
    state = AsyncData(_processDescriptionMessage(state.value!));
  }

  // 以下、元のControllerから移植したヘルパーメソッド群

  Future<Post?> _fetchPost(String uid, String postId) async {
    final ref = DocRefCore.post(uid, postId);
    final result = await FirestoreRepository().getDoc(ref);
    return result.when(
      success: (doc) => doc.exists ? Post.fromJson(doc.data()!) : null,
      failure: (e) => null,
    );
  }

  Future<Uint8List?> _fetchPostImage(Post post) async {
    final detectedImage = post.typedImage();
    return FileUtility.getS3Image(
      detectedImage.bucketName,
      detectedImage.value,
    );
  }

  Future<List<TextMessage>> _getLocalMessages(String postId) async {
    final jsonString = ref.read(prefsProvider).getString(postId) ?? "";
    if (jsonString.isNotEmpty) {
      final List<dynamic> decodedJson = jsonDecode(jsonString);
      return decodedJson
          .map((e) => TextMessage.fromSaveTextMsg(SaveTextMsg.fromJson(e)))
          .toList();
    }
    return [];
  }

  ChatState _processDescriptionMessage(ChatState currentState) {
    return currentState;
  }

  void _addMyMessage(String content) {
    final uid = ref.read(streamAuthUidProvider).value;
    if (uid == null) return;
    final textMessage = _newTextMessage(content, uid);
    final newMessages = List<TextMessage>.from(state.value!.messages)
      ..add(textMessage);
    state = AsyncData(state.value!.copyWith(messages: newMessages));
    _createTextMsgDoc(textMessage);
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

  Future<ChatCompleteText> _createChatRequest(String content) async {
    final post = state.value!.post;
    final requestMessages = _toRequestMessages();
    requestMessages.insert(0, _systemMsg(post));
    final completeText = post.typedCustomCompleteText();
    final model = RemoteConfigConstants.basicModel;
    final uid = ref.read(streamAuthUidProvider).value;

    return ChatCompleteText(
      model: ChatModelFromValue(model: model),
      messages: requestMessages.map((e) => e.toJson()).toList(),
      temperature: completeText.temperature,
      topP: completeText.topP,
      maxToken: _adjustMaxToken(),
      presencePenalty: completeText.presencePenalty,
      frequencyPenalty: completeText.frequencyPenalty,
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
    if (state.value == null) return;
    final post = state.value!.post;
    final objectList =
        state.value!.messages.map(SaveTextMsg.fromTextMessage).toList();
    final jsonString = jsonEncode(objectList);
    await ref.read(prefsProvider).setString(post.postId, jsonString);
  }

  Future<void> _createTextMsgDoc(TextMessage message) async {
    await FirestoreRepository().createDoc(
      message.typedMessageRef(),
      message.toJson(),
    );
  }

  TextMessage _newTextMessage(String content, String senderUid) {
    final post = state.value!.post;
    return TextMessage(
      id: randomString(),
      createdAt: Timestamp.now(),
      messageType: MessageType.text.name,
      messageRef: DocRefCore.message(
        post.uid,
        post.postId,
        senderUid,
        randomString(),
      ),
      postRef: post.typedRef(),
      text: DetectedText(value: content).toJson(),
      posterUid: post.uid,
      senderUid: senderUid,
    );
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

  void onMenuPressed(BuildContext context) async {
    UIHelper.showPopup(
      context: context,
      builder: (innerContext) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(innerContext);

                _cleanLocalMessage();
              },
              child: const Text("会話履歴を削除"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(innerContext);

                onDescriptionButtonPressed();
              },
              child: const Text("情報を見る"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(innerContext);

                _onBookmarkTextTapped();
              },
              child: const Text("ブックマークに追加/削除"),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(innerContext),
              child: const Text("戻る"),
            ),
          ],
        );
      },
    );
  }

  void onDeleteButtonPressed() async {
    final deletePost = state.value?.post;

    if (deletePost == null) return;

    ref.read(postLogicProvider.notifier).deletePost(deletePost);
  }

  void _onBookmarkTextTapped() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }

    if (ref
            .read(tokensNotifierProvider)
            .value
            ?.bookmarkCategoryTokens
            .isEmpty ??
        true) {
      Get.toNamed(BookmarkCategoriesPage.path);

      UIHelper.showFlutterToast("まずはカテゴリーを作成してみましょう!");
    } else {
      Get.dialog(
        BookmarkCategoriesListView(
          onBookmarkCategoryTapped: onBookmarkCategoryTapped,
        ),
      );
    }
  }

  void onBookmarkCategoryTapped(BookmarkCategory category) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }

    final bookmarkRef = DocRefCore.bookmark(category, postId);

    final repository = FirestoreRepository();

    final result = await repository.getDoc(bookmarkRef);

    await result.when(
      success: (res) async {
        res.exists
            ? await _unBookmark(res)
            : await _bookmark(category); // 存在するなら削除、しないなら作成
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("通信に失敗しました");
      },
    );
  }

  Future<void> _bookmark(BookmarkCategory category) async {
    final bookmarkedPost = state.value?.post;

    if (bookmarkedPost == null) return;

    final Timestamp now = Timestamp.now();

    final String passiveUid = bookmarkedPost.uid;

    final postRef = bookmarkedPost.ref;

    final postId = bookmarkedPost.postId;

    final bookmarkRef = DocRefCore.bookmark(category, postId);

    final bookmark = Bookmark(
      activeUid: ref.read(streamAuthUidProvider).value!,
      ref: bookmarkRef,
      categoryId: category.id,
      createdAt: now,
      passiveUid: passiveUid,
      postRef: postRef,
      postId: postId,
    );

    final repository = FirestoreRepository();

    final result = await repository.createDoc(bookmarkRef, bookmark.toJson());

    result.when(
      success: (_) {
        Get.back();

        UIHelper.showFlutterToast(
          "${bookmarkedPost.typedTitle().value}を${category.title}に保存しました。",
        );
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("保存が失敗しました。");
      },
    );
  }

  Future<void> _unBookmark(Doc doc) async {
    final repository = FirestoreRepository();

    final result = await repository.deleteDoc(doc.reference);

    result.when(
      success: (_) {
        Get.back();

        UIHelper.showFlutterToast("ブックマークを解除しました。");
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("ブックマークを解除できませんでした。");
      },
    );
  }

  void onDescriptionButtonPressed() => _showDescriptionDialog();

  void _showDescriptionDialog() {
    final post = state.value?.post;

    if (post == null) return;

    final title = "タイトル:\n${post.typedTitle().value}";

    final systemPrompt =
        "システムプロンプト:\n${post.typedCustomCompleteText().systemPrompt}";

    String msgText = "累計メッセージ数:\n${post.msgCount.formatNumber()}";

    UIHelper.simpleAlertDialog(
      "$title\n\n$systemPrompt\n\n$msgText",
      needsSubscribing: true,
    );
  }

  Future<void> _cleanLocalMessage() async {
    final stateValue = state.value;
    if (stateValue == null) return;
    final messages = stateValue.messages;

    state = AsyncData(stateValue.copyWith(messages: messages));

    UIHelper.showFlutterToast(clearChatMsg);

    final prefs = ref.read(prefsProvider);
    await prefs.remove(postId);
  }
}
