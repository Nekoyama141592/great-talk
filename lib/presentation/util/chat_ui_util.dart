import 'package:flutter/cupertino.dart';
import 'package:great_talk/core/extension/number_format_extension.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';

class ChatUiUtil {
  static void descriptionDialog(BuildContext context, PostEntity post) {
    final title = "タイトル:\n${post.title.value}";

    final systemPrompt = "システムプロンプト:\n${post.customCompleteText.systemPrompt}";

    String msgText = "累計メッセージ数:\n${post.msgCount.formatNumber()}";

    ToastUiUtil.simpleAlertDialog(
      context,
      "$title\n\n$systemPrompt\n\n$msgText",
      needsSubscribing: true,
    );
  }

  static void menu({
    required BuildContext context,
    required PostEntity post,
    required void Function(BuildContext context) cleanLocalMessage,
  }) async {
    ToastUiUtil.showPopup(
      context: context,
      builder: (innerContext) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(innerContext);
                cleanLocalMessage(innerContext);
              },
              child: const Text("会話履歴を削除"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(innerContext);
                descriptionDialog(context, post);
              },
              child: const Text("情報を見る"),
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
}
