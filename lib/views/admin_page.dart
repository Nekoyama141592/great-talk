import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/consts/remote_config_constants.dart';
import 'package:great_talk/controllers/admin_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/rounded_button.dart';
import 'package:great_talk/views/create_post/components/form_label.dart';
import 'package:great_talk/views/create_post/components/original_form.dart';

class AdminPage extends HookWidget {
  const AdminPage({
    Key? key,
  }) : super(key: key);
  static const path = "/admin";
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
                  const SelectableText(
                    "アプリバージョン: ${RemoteConfigConstants.appVersion}",
                  ),
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
                  const BasicHeightBox(),
                  const FormLabel(
                      title: "公式フラグを反転するUID",
                      helpMsg: FormConsts.updateOfficialHelpMsg),
                  OriginalForm(
                    keyboardType: TextInputType.text,
                    onChanged: controller.setOfficialUid,
                    validator: (value) {
                      return (value?.isEmpty ?? true) ? "入力してください" : null;
                    },
                  ),
                  const BasicHeightBox(),
                  RoundedButton(
                    text: "実行する",
                    press: controller.onPositiveButtonPressed,
                  )
                ],
              )),
      ),
    );
  }
}
