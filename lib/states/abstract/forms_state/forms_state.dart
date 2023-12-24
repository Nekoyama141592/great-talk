import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/controllers/abstract/forms_controller.dart';
import 'package:great_talk/states/abstract/forms_state/components/to_generate_image_page_button.dart';
import 'package:great_talk/views/components/rounded_button.dart';

abstract class FormsState<T extends StatefulWidget> extends State<T> {
  double? deviceHeight;
  // ログとフォームキーをとる
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget image(FormsController controller) {
    return Obx(() => controller.rxUint8list.value == null
        ? Row(
            children: [
              InkWell(
                onTap: controller.onImagePickButtonPressed,
                child: const Icon(
                  Icons.image,
                  size: 100.0,
                ),
              ),
              const Column(
                children: [Text(FormConsts.imageLabel), ToGeneratePageButton()],
              )
            ],
          )
        : InkWell(
            onTap: controller.onImagePickButtonPressed,
            child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: Obx(
                  () => Image.memory(controller.rxUint8list.value!),
                )),
          ));
  }

  Widget positiveButton(FormsController controller) {
    return RoundedButton(
        text: "送信",
        press: () => _onPositiveButtonPressed(controller),
        buttonColor: Theme.of(context).primaryColor,
        textColor: Colors.white);
  }

  void _onPositiveButtonPressed(FormsController controller) async {
    if (formKey.currentState!.validate()) {
      // フォームフィールドの情報を変数に保存
      formKey.currentState!.save();
    }
    controller.onPositiveButtonPressed();
  }

  bool get canPop {
    if (formKey.currentState!.validate()) {
      // フォームフィールドの情報を変数に保存
      formKey.currentState!.save();
    }
    return true; // 画面を閉じる処理を許可
  }
}
