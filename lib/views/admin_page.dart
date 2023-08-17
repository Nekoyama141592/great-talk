import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/controllers/admin_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';

class AdminPage extends HookWidget {
  const AdminPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());
    const style = TextStyle(fontSize: 20.0);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await controller.init();
      });
      return;
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text("管理者専用ページ"),
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPadding(context)),
        child: Obx(() => !CurrentUserController.to.isAdmin()
            ? const SizedBox.shrink()
            : ListView(
                children: [
                  Obx(() => SelectableText(
                        "登録ユーザー数 ${controller.userCount}",
                        style: style,
                      )),
                  const Divider(),
                  Obx(() => SelectableText(
                        "累計ポスト数 ${controller.postCount}",
                        style: style,
                      )),
                  const Divider(),
                  Obx(() => SelectableText(
                        "累計メッセージ数 ${controller.messageCount}",
                        style: style,
                      )),
                  const Divider(),
                  Obx(() => SelectableText(
                        "累計検索数 ${controller.searchCount}",
                        style: style,
                      )),
                ],
              )),
      ),
    );
  }
}
