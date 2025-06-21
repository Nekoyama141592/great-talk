import 'package:flutter/cupertino.dart';
import 'package:great_talk/ui_core/texts.dart';

class PostUiCore {
  static void onReportButtonPressed({
    required BuildContext context,
    required void Function(BuildContext) mutePost,
    required void Function(BuildContext) reportPost,
    required void Function(BuildContext) muteUser,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder:
          (innerContext) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () => mutePost(innerContext),
                child: const BasicBoldText("投稿をミュート"),
              ),
              CupertinoActionSheetAction(
                onPressed: () => reportPost(innerContext),
                child: const BasicBoldText("投稿を運営に報告,通報"),
              ),
              CupertinoActionSheetAction(
                onPressed: () => muteUser(innerContext),
                child: const BasicBoldText("ユーザーをミュート"),
              ),
              CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(innerContext),
                child: const BasicBoldText('キャンセル'),
              ),
            ],
          ),
    );
  }
}
