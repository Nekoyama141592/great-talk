import 'package:flutter/cupertino.dart';
import 'package:great_talk/extension/number_format_extension.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/ui_core/ui_helper.dart';

class ChatUiCore {
  static void onDescriptionButtonPressed(BuildContext context, Post post) {
    final title = "タイトル:\n${post.typedTitle().value}";

    final systemPrompt =
        "システムプロンプト:\n${post.typedCustomCompleteText().systemPrompt}";

    String msgText = "累計メッセージ数:\n${post.msgCount.formatNumber()}";

    UIHelper.simpleAlertDialog(
      context,
      "$title\n\n$systemPrompt\n\n$msgText",
      needsSubscribing: true,
    );
  }

  static void onMenuPressed({
    required BuildContext context,
    required Post post,
    required void Function() cleanLocalMessage,
  }) async {
    UIHelper.showPopup(
      context: context,
      builder: (innerContext) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(innerContext);

                cleanLocalMessage();
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
