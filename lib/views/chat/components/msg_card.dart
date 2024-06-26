import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/controllers/chat_controller.dart';
import 'package:great_talk/extensions/custom_date_time_formatting.dart';
import 'package:great_talk/ui_core/padding_core.dart';
import 'package:great_talk/ui_core/text_core.dart';
import 'package:great_talk/views/chat/components/latex_text.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/circle_image/circle_image.dart';
import 'package:get/get.dart';

class MsgCard extends StatelessWidget {
  const MsgCard(
      {super.key,
      required this.isMyMsg,
      required this.isAnotherDay,
      required this.text,
      required this.index,
      this.createdAt});
  final bool isMyMsg;
  final bool isAnotherDay;
  final String text;
  final int index;
  final Timestamp? createdAt;
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20.0);
    final widthRate = isMyMsg ? 0.6 : 0.5;
    final fullWidth = MediaQuery.of(context).size.width;
    final textWidth = fullWidth * widthRate;
    final controller = ChatController.to;
    final myColor = Theme.of(context).colorScheme.inversePrimary;
    final rowChildren = [
      Column(
        children: [
          if (isMyMsg) const Text("既読"),
          if (createdAt != null)
            Text(
              createdAt!.toDate().timeString(),
            ),
        ],
      ),
      const SizedBox(
        width: 4.0,
      ),
      SizedBox(
        width: TextCore.doesOverFlow(
                text, style, textWidth - PaddingCore.defaultPadding(context))
            ? textWidth
            : null,
        child: InkWell(
          onTap: controller.isGeneratingMsg(index)
              ? null
              : () => controller.onCardTap(context, index),
          child: Container(
              padding: PaddingCore.defaultAll(context),
              decoration: BoxDecoration(
                color: isMyMsg ? myColor : null,
                border: Border.all(
                    color: isMyMsg ? myColor : Theme.of(context).focusColor),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: LatexText(
                data: text,
              )),
        ),
      ),
      isMyMsg
          ? const SizedBox.shrink()
          : Obx(() => CircleImage(
                uint8list: controller.rxUint8list.value,
              )),
    ];
    final child = Container(
      width: fullWidth * 0.9,
      padding: isMyMsg
          ? EdgeInsets.only(left: fullWidth * 0.1, top: 4.0, bottom: 4.0)
          : EdgeInsets.only(top: 4.0, right: fullWidth * 0.1, bottom: 4.0),
      child: Row(
        mainAxisAlignment:
            isMyMsg ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: isMyMsg ? rowChildren : rowChildren.reversed.toList(),
      ),
    );
    return isAnotherDay && createdAt != null
        ? Column(
            children: [
              const BasicHeightBox(),
              Text(createdAt!.toDate().japaneseDifference()),
              const BasicHeightBox(),
              child
            ],
          )
        : child;
  }
}
