import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/date_converter.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/consts/chatgpt_contants.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/controllers/abstract/loading_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/controllers/remote_config_controller.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/extensions/number_format_extension.dart';
import 'package:great_talk/infrastructure/chat_gpt_sdk_client.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/bookmark/bookmark.dart';
import 'package:great_talk/model/bookmark_category/bookmark_category.dart';
import 'package:great_talk/model/chat_count_today/chat_count_today.dart';
import 'package:great_talk/model/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/open_ai/generate_text/generate_text_request/generate_text_response.dart';
import 'package:great_talk/model/open_ai/generate_text/generate_text_response/generate_text_request.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/model/save_text_msg/save_text_msg.dart';
import 'package:great_talk/model/text_message/text_message.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/repository/open_ai_repository.dart';
import 'package:great_talk/repository/wolfram_repository.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/utility/prefs_utility.dart';
import 'package:great_talk/views/bookmark_categories_page.dart';
import 'package:great_talk/views/main/subscribe/subscribe_page.dart';
import 'package:great_talk/views/chat/components/bookmark_categories_list_view.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatController extends LoadingController with CurrentUserMixin {
  static ChatController get to => Get.find<ChatController>();
  final messages = <TextMessage>[].obs;
  final realtimeRes = "".obs;
  final isGenerating = false.obs;
  late SharedPreferences prefs;
  final Rx<Post?> rxPost = Rx(null);
  final Rx<Uint8List?> rxUint8list = Rx(null);
  String get postId => Get.parameters['postId']!;

  ChatModel get model => PurchasesController.to.model();
  @override
  void onInit() async {
    startLoading();
    prefs = await SharedPreferences.getInstance();
    endLoading();
    super.onInit();
  }

  void resetState() {
    messages([]);
    realtimeRes('');
    isLoading(false);
    isGenerating(false);
    rxPost.value = null;
  }

  Future<void> init() async {
    await _getChatLog();
    _processDescriptionMessage();
  }

  void _processDescriptionMessage() {
    final post = rxPost.value;
    if (post == null) return;
    if (messages.isEmpty) {
      _addDescriptionMessage(post);
    }
  }

  // 与えられたinterlocutorとのチャット履歴を取得
  Future<void> _getChatLog() async {
    startLoading();
    final uid = Get.parameters['uid']!;
    final ref = DocRefCore.post(uid, postId);
    final repository = FirestoreRepository();
    final result = await repository.getDoc(ref);
    result.when(success: (res) async {
      if (res.exists) {
        final fetchedPost = Post.fromJson(res.data()!);
        rxPost(fetchedPost);
        final detectedImage = fetchedPost.typedImage();
        final s3Image = await FileUtility.getS3Image(
            detectedImage.bucketName, detectedImage.value);
        rxUint8list(s3Image);
      } else {
        UIHelper.showFlutterToast("投稿が存在しません");
        return;
      }
    }, failure: () {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
    List<TextMessage> a = await _getLocalMessages();
    messages(a);
    endLoading();
  }

  Future<List<TextMessage>> _getLocalMessages() async {
    final post = rxPost.value;
    if (post == null) {
      return [];
    }
    final jsonString = prefs.getString(post.postId) ?? "";
    List<TextMessage> messages = [];
    if (jsonString.isNotEmpty) {
      final List<dynamic> decodedJson = jsonDecode(jsonString);
      final saveTextMsgs =
          decodedJson.map((e) => SaveTextMsg.fromJson(e)).toList();
      messages =
          saveTextMsgs.map((e) => TextMessage.fromSaveTextMsg(e)).toList();
    } else {
      messages = [];
    }
    return messages;
  }

  void onSendPressed(
      BuildContext context,
      TextEditingController inputController,
      ScrollController scrollController) async {
    final text = inputController.text;
    if (text.length > FormConsts.maxMessageLimit) {
      UIHelper.showErrorFlutterToast(
          "メッセージは${FormConsts.textLimitMsg(FormConsts.maxMessageLimit, text)}");
      return;
    }
    FocusScope.of(context).unfocus();
    final chatCountToday = await getChatCount(); // 端末から今日のチャット回数を取得
    final remoteConfigController = RemoteConfigController.to;
    final chatLimitPerDay = remoteConfigController.chatLimitPerDay;
    final premiumLimit = chatLimitPerDay.premium;
    final freeLimit = chatLimitPerDay.free;
    final basicLimit = chatLimitPerDay.basic;
    if (chatCountToday.premium >= premiumLimit &&
        PurchasesController.to.isPremiumSubscribing()) {
      UIHelper.showFlutterToast(
          "利用コストの急激な増加により、一時的にプレミアムプランでのAPI利用回数を一日につき$premiumLimit回までに制限させていただいています。\nご迷惑をおかけし、大変申し訳ございません。");
      return;
    } else if (chatCountToday.basic >= freeLimit &&
        !PurchasesController.to.isSubscribing()) {
      // 無料回数を超過し、サブスクに入っていない場合
      Get.toNamed(SubscribePage.path); // サブスクページへ飛ばす.
      UIHelper.showFlutterToast("チャットは1日$freeLimit回まで！\nサブスクに加入してください。");
      await _requestReview(); // レビューをリクエスト
      return;
    } else if (chatCountToday.basic >= basicLimit &&
        PurchasesController.to.isSubscribing()) {
      // 一時的にベーシックプランの利用が制限されている場合.
      UIHelper.showFlutterToast(
          "利用コストの急激な増加により、一時的にベーシックプランでのAPI利用回数を一日につき$basicLimit回までに制限させていただいています。\nご迷惑をおかけし、大変申し訳ございません。");
      return;
    } else {
      await execute(scrollController, text, inputController); // ChatGPTのAPIを実行
      return;
    }
  }

  Future<void> execute(ScrollController scrollController, String content,
      TextEditingController inputController) async {
    final post = rxPost.value;
    if (post == null) return;
    _setValues(); // チャットした日と回数を端末に保存.
    _addMyMessage(content);
    _addEmptyMessage(); // Viewで表示できる要素数を一つ増やす
    realtimeRes(""); // realtimeResを初期化
    messages([...messages]); // messageを再代入して変更をViewに反映
    // リクエストを作成
    final requestMessages = await _createRequestMessages(content);
    final jsonMessages = requestMessages.map((e) => e.toJson()).toList();
    final CustomCompleteText completeText = post.typedCustomCompleteText();
    final request = ChatCompleteText(
      model: model,
      messages: jsonMessages,
      temperature: completeText.temperature,
      topP: completeText.topP,
      maxToken: _adjustMaxToken(),
      presencePenalty: completeText.presencePenalty,
      frequencyPenalty: completeText.frequencyPenalty,
      user: currentUid(),
    );
    _listenToChatCompletionSSE(request, scrollController); // ChatGPTのリアルタイム出力
    inputController.text = "";
  }

  int _adjustMaxToken() {
    const maxRequestLength = ChatGPTConstants.maxRequestLength;
    final maxToken = PurchasesController.to.maxToken();
    final result = messages.length < maxRequestLength
        ? maxToken ~/ (maxRequestLength - 1)
        : maxToken;
    return result;
  }

  void _addEmptyMessage() {
    final post = rxPost.value;
    if (post == null) return;
    messages.add(_newtTextMessage('', post.postId));
  }

  void _scrollToBottom(ScrollController scrollController) {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  void _listenToChatCompletionSSE(
      ChatCompleteText request, ScrollController scrollController) {
    // 生成中なら何もしない
    final post = rxPost.value;
    if (isGenerating.value || post == null) return;
    isGenerating(true);
    final client = ChatGptSdkClient();
    client.openAI.onChatCompletionSSE(request: request).transform(
        StreamTransformer.fromHandlers(handleError: (err, stackTrace, sink) {
      if (err is OpenAIAuthError) {
        UIHelper.showFlutterToast("OpenAIの認証でエラーが発生しました。運営の対応をお待ちください。");
      }
      if (err is OpenAIRateLimitError) {
        UIHelper.showFlutterToast("RateLimitエラーが発生しました。しばらく待ってからお試しください。");
      }
      if (err is OpenAIServerError) {
        UIHelper.showFlutterToast("OpenAIのサーバーでエラーが発生しました。しばらく待ってからお試しください。");
      }
    })).listen((it) {
      final content = (it as ChatResponseSSE).choices?.last.message?.content;
      if (content != null && content.isNotEmpty) {
        realtimeRes(realtimeRes.value + content);
        _scrollToBottom(scrollController);
      }
    }, onDone: () {
      final post = rxPost.value;
      if (post == null) return;
      final completedMsg = _newtTextMessage(realtimeRes.value, post.postId);
      messages.last = completedMsg;
      messages([...messages]);
      isGenerating(false);
      _setLocalMessage();
    }, onError: (e) {
      setChatCount(false); // チャット数を保存
      messages.removeRange(
          messages.length - 2, messages.length); // うまく生成できなかったメッセージを削除
      messages([...messages]);
      isGenerating(false);
    });
  }

  Future<void> _createTextMsgDoc(TextMessage message) async {
    final repository = FirestoreRepository();
    final ref = message.typedMessageRef();
    final json = message.toJson();
    await repository.createDoc(ref, json);
  }

  Future<ChatCountToday> getChatCount() async {
    final SDMap? json =
        await PrefsUtility.getJson(PrefsKey.chatCountToday.name, prefs: prefs);
    ChatCountToday chatCountToday =
        json != null ? ChatCountToday.fromJson(json) : const ChatCountToday();
    // もし、最後のチャットから24時間経過していたらchatCountを0にして送信を許可
    if (await _is24HoursFromLast()) {
      chatCountToday = const ChatCountToday();
    }
    return chatCountToday;
  }

  Future<bool> _is24HoursFromLast() async {
    final int last = prefs.getInt(PrefsKey.lastChatDate.name) ?? 0;
    final lastDay = DateConverter.intToDateTime(last);
    final now = DateTime.now();
    return last == 0 ? true : DateConverter.isCrossingDate(lastDay, now);
  }

  Future<void> _requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;
    final isAvailable = await inAppReview.isAvailable();
    if (isAvailable) {
      await inAppReview.requestReview();
    }
  }

  Future<void> _setValues() async {
    await Future.wait([_setLocalDate(), setChatCount(true)]);
  }

  Future<void> _setLocalMessage() async {
    final post = rxPost.value;
    if (post == null) return;
    final objectList =
        messages.map((e) => SaveTextMsg.fromTextMessage(e)).toList();
    final jsonString = jsonEncode(objectList);
    await prefs.setString(post.postId, jsonString);
  }

  Future<void> _setLocalDate() async {
    final dateInt = DateConverter.dateTimeToInt(DateTime.now());
    await prefs.setInt(PrefsKey.lastChatDate.name, dateInt);
  }

  Future<void> setChatCount(bool isIncreace) async {
    // 24時間経過していたらchatCountには0がくる
    final chatCountToday = await getChatCount();
    final newChatCountToday =
        isIncreace ? chatCountToday.increaced() : chatCountToday.decreaced();
    await PrefsUtility.setJson(
        PrefsKey.chatCountToday.name, newChatCountToday.toJson(),
        prefs: prefs);
  }

  TextMessage _newtTextMessage(String content, String senderUid) {
    final now = Timestamp.now();
    final id = randomString();
    final post = rxPost.value;
    final posterUid = post!.uid;
    final textMessage = TextMessage(
      createdAt: now,
      id: id,
      messageType: MessageType.text.name,
      messageRef: DocRefCore.message(posterUid, post.postId, currentUid(), id),
      postRef: post.typedRef(),
      text: DetectedText(value: content).toJson(),
      posterUid: posterUid,
      senderUid: senderUid,
    );
    return textMessage;
  }

  void _addMyMessage(String content) {
    final textMessage = _newtTextMessage(content, currentUid());
    messages.add(textMessage);
    messages([...messages]);
    _createTextMsgDoc(textMessage); // firestoreにメッセージを追加
  }

  void _addDescriptionMessage(Post post) {
    final textMessage =
        _newtTextMessage(post.typedDescription().value, post.postId);
    messages.add(textMessage);
  }

  Future<List<Messages>> _createRequestMessages(String content) async {
    final post = rxPost.value;
    if (post == null) return [];
    final id = post.postId;
    switch (id) {
      case calculateAI:
        final response = await gptFunctionCalling(content);
        if (response != null && response.choices.isNotEmpty) {
          final List<dynamic> tools =
              response.choices.first["message"]["tool_calls"];
          if (tools.isNotEmpty) {
            debugPrint("${tools.first["function"]}");
          }
        }
        List<Messages> requestMessages = [];
        final wolframRes = await WolframRepository.fetchApi(content);
        wolframRes.when(success: (res) {
          requestMessages = [
            Messages(
                role: Role.system,
                content: "わかりやすく、学術的な日本語にして下さい。大きい数字は3桁ごとにカンマ(,)を入れてください"),
            Messages(role: Role.user, content: res)
          ];
        }, failure: () {
          realtimeRes("計算AIから結果が得られなかったので普通のAIが対応します。\n\n");
          requestMessages = [Messages(role: Role.user, content: content)];
        });
        return requestMessages;
      default:
        final requestMessages = _toRequestMessages();
        requestMessages.insert(0, _systemMsg());
        return requestMessages;
    }
  }

  Future<GenerateTextResponse?> gptFunctionCalling(String content) async {
    final request = GenerateTextRequest(model: model.model, messages: [
      Messages(role: Role.user, content: content).toJson(),
    ], tools: [
      {
        "type": "function",
        "function": {
          "name": "get_current_weather",
          "description": "Get the current weather",
          "parameters": {
            "type": "object",
            "properties": {
              "location": {
                "type": "string",
                "description": "The city and state, e.g. San Francisco, CA",
              },
              "format": {
                "type": "string",
                "enum": ["celsius", "fahrenheit"],
                "description":
                    "The temperature unit to use. Infer this from the users location.",
              },
            },
            "required": ["location", "format"],
          },
        }
      },
    ], tool_choice: {
      "type": "function",
      "function": {"name": "get_current_weather"}
    });
    GenerateTextResponse? response;
    final repository = OpenAIRepository();
    final result = await repository.generateText(request);
    result.when(
        success: (res) {
          response = res;
        },
        failure: () {});
    return response;
  }

  Messages _toRequestMessage(TextMessage msg) {
    return Messages(
        role: msg.senderUid == currentUid() ? Role.user : Role.assistant,
        content: msg.typedText().value);
  }

  List<Messages> _toRequestMessages() {
    // メッセージからリクエストを送るJsonを生成.
    // メッセージ数を制限する。
    const maxRequestLength = ChatGPTConstants.maxRequestLength;
    final requestMessages = messages.length > maxRequestLength
        ? messages.sublist(messages.length - maxRequestLength)
        : messages;
    final List<Messages> result =
        requestMessages.map((e) => _toRequestMessage(e)).toList();
    return result;
  }

  Messages _systemMsg() {
    final post = rxPost.value;
    final content = post!.typedCustomCompleteText().systemPrompt;
    return Messages(role: Role.system, content: content);
  }

  void onCardLongTap() {
    if (PurchasesController.to.isSubscribing()) {
      return;
    } else {
      UIHelper.showFlutterToast("テキストをコピーするには有料プランを登録する必要があります");
      return;
    }
  }

  void onDescriptionButtonPressed() => _showDescriptionDialog();

  void _showDescriptionDialog() {
    final post = rxPost.value;
    if (post == null) return;
    final title = "タイトル:\n${post.typedTitle().value}";
    final systemPrompt =
        "システムプロンプト:\n${post.typedCustomCompleteText().systemPrompt}";
    String msgText = "累計メッセージ数:\n${post.msgCount.formatNumber()}";
    UIHelper.simpleAlertDialog("$title\n\n$systemPrompt\n\n$msgText",
        needsSubscribing: true);
  }

  bool isMyContent(TextMessage message) {
    if (message.senderUid == currentUid()) return true;
    final post = rxPost.value;
    if (message.senderUid != post!.postId) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _cleanLocalMessage() async {
    if (messages.isEmpty) return;
    messages([]); // 初期化.
    UIHelper.showFlutterToast(clearChatMsg);
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(postId);
  }

  void onDeleteButtonPressed() async {
    final deletePost = rxPost.value;
    if (deletePost == null) return;
    PostsController.to.deletePost(deletePost);
  }

  void _onBookmarkTextTapped() {
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    if (CurrentUserController.to.bookmarkCategoryTokens.isEmpty) {
      Get.toNamed(BookmarkCategoriesPage.path);
      UIHelper.showFlutterToast("まずはカテゴリーを作成してみましょう!");
    } else {
      Get.dialog(const BookmarkCategoriesListView());
    }
  }

  void onBookmarkCategoryTapped(BookmarkCategory category) async {
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    final bookmarkRef = DocRefCore.bookmark(category, postId);
    final repository = FirestoreRepository();
    final result = await repository.getDoc(bookmarkRef);
    result.when(success: (res) async {
      res.exists
          ? await _unBookmark(res)
          : await _bookmark(category); // 存在するなら削除、しないなら作成
    }, failure: () {
      UIHelper.showErrorFlutterToast("通信に失敗しました");
    });
  }

  Future<void> _bookmark(BookmarkCategory category) async {
    final bookmarkedPost = rxPost.value;
    if (bookmarkedPost == null) return;
    final Timestamp now = Timestamp.now();
    final String passiveUid = bookmarkedPost.uid;
    final postRef = bookmarkedPost.ref;
    final postId = bookmarkedPost.postId;
    final bookmarkRef = DocRefCore.bookmark(category, postId);
    final bookmark = Bookmark(
      activeUid: currentUid(),
      ref: bookmarkRef,
      categoryId: category.id,
      createdAt: now,
      passiveUid: passiveUid,
      postRef: postRef,
      postId: postId,
    );
    final repository = FirestoreRepository();
    final result = await repository.createDoc(bookmarkRef, bookmark.toJson());
    result.when(success: (_) {
      Get.back();
      UIHelper.showFlutterToast(
          "${bookmarkedPost.typedTitle().value}を${category.title}に保存しました。");
    }, failure: () {
      UIHelper.showErrorFlutterToast("保存が失敗しました。");
    });
  }

  Future<void> _unBookmark(Doc doc) async {
    final repository = FirestoreRepository();
    final result = await repository.deleteDoc(doc.reference);
    result.when(success: (_) {
      Get.back();
      UIHelper.showFlutterToast("ブックマークを解除しました。");
    }, failure: () {
      UIHelper.showErrorFlutterToast("ブックマークを解除できませんでした。");
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
                  child: const Text("会話履歴を削除")),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(innerContext);
                    onDescriptionButtonPressed();
                  },
                  child: const Text("情報を見る")),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(innerContext);
                    _onBookmarkTextTapped();
                  },
                  child: const Text("ブックマークに追加/削除")),
              CupertinoActionSheetAction(
                  onPressed: () => Navigator.pop(innerContext),
                  child: const Text("戻る"))
            ],
          );
        });
  }
}
