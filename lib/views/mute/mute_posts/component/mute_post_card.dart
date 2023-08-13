import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/mute_posts_controller.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/circle_image.dart';

class MutePostCard extends StatelessWidget {
  const MutePostCard({Key? key, required this.post, required this.uint8list})
      : super(key: key);
  final Post post;
  final Uint8List? uint8list;
  @override
  Widget build(BuildContext context) {
    final controller = MutePostsController.to;
    return ListTile(
      leading: CircleImage(
        bucketName: post.typedImage().bucketName,
        imageValue: post.typedImage().value,
        uint8list: uint8list,
      ),
      title: BasicBoldText(post.typedTitle().value),
      onTap: () => controller.onTap(post),
    );
  }
}
