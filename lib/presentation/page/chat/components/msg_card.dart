import 'package:flutter/material.dart';
import 'package:great_talk/core/extension/custom_date_time_formatting.dart';
import 'package:great_talk/core/util/image_url_util.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/presentation/util/padding_core.dart';
import 'package:great_talk/presentation/util/text_core.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';
import 'package:great_talk/presentation/component/circle_image/circle_image.dart';

class MsgCard extends StatelessWidget {
  const MsgCard({
    super.key,
    required this.isMyMsg,
    required this.isAnotherDay,
    required this.text,
    this.createdAt,
    this.senderUid, // 送信者のUID
    required this.post
  });

  final bool isMyMsg;
  final bool isAnotherDay;
  final String text;
  final DateTime? createdAt;
  final String? senderUid; // 送信者のUID
  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20.0);
    final widthRate = isMyMsg ? 0.6 : 0.5;
    final fullWidth = MediaQuery.of(context).size.width;
    final textWidth = fullWidth * widthRate;
    final myColor = Theme.of(context).colorScheme.inversePrimary;

    final rowChildren = [
      Column(
        children: [
          if (isMyMsg) const Text("既読"),
          if (createdAt != null) Text(createdAt!.timeString()),
        ],
      ),
      const SizedBox(width: 4.0),
      SizedBox(
        width:
            TextCore.doesOverFlow(
                  text,
                  style,
                  textWidth - PaddingCore.defaultPadding(context),
                )
                ? textWidth
                : null,
        child: Container(
          padding: PaddingCore.defaultAll(context),
          decoration: BoxDecoration(
            color: isMyMsg ? myColor : null,
            border: Border.all(
              color: isMyMsg ? myColor : Theme.of(context).focusColor,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(text),
        ),
      ),
      if (!isMyMsg && senderUid != null)
        CircleImage(isModerated: true,imageUrl: ImageUrlUtil.getPostImageUrl(post.uid,post.postId))
      else
        const SizedBox.shrink(),
    ];

    final child = Container(
      width: fullWidth * 0.9,
      padding:
          isMyMsg
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
            Text(createdAt!.japaneseDifference()),
            const BasicHeightBox(),
            child,
          ],
        )
        : child;
  }
}
