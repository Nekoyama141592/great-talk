import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/core/doubles.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/views/components/rounded_button.dart';

class ReportContentsListView extends StatelessWidget {
  const ReportContentsListView({super.key});
  @override
  Widget build(BuildContext context) {
    const List<String> reportContents = ["暴力的なコンテンツ", "性的なコンテンツ", "不快なコンテンツ"];
    final controller = PostsController.to;
    // dialogで表示するので高さが必要
    return SizedBox(
        height: fullHeight(context) * 0.8,
        child: Padding(
          padding: EdgeInsets.all(defaultPadding(context)),
          child: Column(
            children: [
              SizedBox(
                height: fullHeight(context) * 0.7,
                child: Material(
                  child: ListView.builder(
                    itemCount: reportContents.length,
                    itemBuilder: (context, index) {
                      final String content = reportContents[index];
                      return InkWell(
                        onTap: () => controller.onReportContentTapped(content),
                        child: Row(
                          children: [
                            Obx(
                              () => controller.reportContents.contains(content)
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: BasicBoldText(content),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(defaultPadding(context)),
                child: Row(
                  children: [
                    RoundedButton(
                      widthRate: 0.45,
                      buttonColor: Colors.grey,
                      press: () {
                        if (Get.isDialogOpen ?? false) {
                          controller.reportContents([]);
                          Get.back();
                        }
                      },
                      text: cancelText,
                    ),
                    const Spacer(),
                    Obx(
                      () => RoundedButton(
                          widthRate: 0.45,
                          buttonColor: controller.reportContents.isNotEmpty
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          press: controller.onOkCreatePostReportButtonPressed,
                          text: okText),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
