import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/controllers/generate_image_controller.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/basic_page.dart';
import 'package:great_talk/views/components/rounded_button.dart';
import 'package:great_talk/views/create_post/components/original_form.dart';
import 'package:great_talk/views/generate_image/components/generated_image.dart';
import 'package:great_talk/views/screen/loading_screen.dart';

class GenerateImagePage extends StatelessWidget {
  const GenerateImagePage({Key? key}) : super(key: key);
  static const path = "/generateImage";
  @override
  Widget build(BuildContext context) {
    final controller = GenerateImageController.to;
    return BasicPage(
        appBarText: "AIを使用して画像を生成",
        child: Obx(
          () => controller.isLoading.value
              ? const LoadingScreen()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const GeneratedImage(),
                      Obx(
                        () => OriginalForm(
                          decoration: const InputDecoration(
                              hintText: FormConsts.generateImageHint),
                          initialValue: controller.rxPrompt.value,
                          keyboardType: TextInputType.text,
                          onChanged: controller.setPrompt,
                        ),
                      ),
                      const BasicHeightBox(),
                      RoundedButton(
                        text: "生成する",
                        press: controller.onGenerateButtonPressed,
                      )
                    ],
                  ),
                ),
        ));
  }
}
