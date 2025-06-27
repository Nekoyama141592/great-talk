import 'package:flutter/cupertino.dart';
import 'package:great_talk/core/extension/number_format_extension.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
import 'package:great_talk/presentation/common/toast_ui_core.dart';

class ChatUiCore {
  static void onDescriptionButtonPressed(BuildContext context, Post post) {
    final title = "タイトル:\n${post.typedTitle().value}";

    final systemPrompt =
        "システムプロンプト:\n${post.typedCustomCompleteText().systemPrompt}";

    String msgText = "累計メッセージ数:\n${post.msgCount.formatNumber()}";

    ToastUiCore.simpleAlertDialog(
      context,
      "$title\n\n$systemPrompt\n\n$msgText",
      needsSubscribing: true,
    );
  }

  static void onMenuPressed({
    required BuildContext context,
    required Post post,
    required void Function(BuildContext context) cleanLocalMessage,
  }) async {
    ToastUiCore.showPopup(
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
                onDescriptionButtonPressed(context, post);
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
