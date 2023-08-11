import 'package:flutter/material.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/mute_posts_controller.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/circle_image.dart';

class MutePostCard extends StatelessWidget {
  const MutePostCard({Key? key, required this.post}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    final controller = MutePostsController.to;
    return ListTile(
      leading: CircleImage(
          bucketName: post.typedImage().bucketName,
          imageValue: post.typedImage().value),
      title: BasicBoldText(post.typedTitle().value),
      onTap: () => controller.onTap(post),
    );
  }
}
