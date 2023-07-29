import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:great_talk/model/chat_user/chat_user.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatUtility {
  static void showCleanLocalMsgDialog(
      ChatUser person, PersonsController controller) {
    Get.dialog(CupertinoAlertDialog(
      content: const Text("履歴を全て削除しますがよろしいですか？"),
      actions: [
        CupertinoDialogAction(onPressed: Get.back, child: const Text('キャンセル')),
        CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () async {
              await _cleanLocalMessage(person, controller);
              Get.back();
            },
            child: const Text("OK"))
      ],
    ));
  }

  static Future<void> _cleanLocalMessage(
      ChatUser person, PersonsController controller) async {
    final prefs = await SharedPreferences.getInstance();
    await controller.cleanMetadata(person);
    await prefs.remove(person.uid);
    await UIHelper.showFlutterToast(clearChatMsg);
  }
}
