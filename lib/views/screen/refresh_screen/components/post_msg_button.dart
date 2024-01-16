import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/extensions/number_format_extension.dart';
import 'package:great_talk/model/post/post.dart';

class PostMsgButton extends HookWidget {
  const PostMsgButton({
    Key? key,
    required this.isHorizontal,
    required this.post,
  }) : super(key: key);
  final bool isHorizontal;
  final Post post;
  @override
  Widget build(BuildContext context) {
    final controller = PostsController.to;
    final children = [
      InkWell(
          child: const Icon(
            Icons.comment,
          ),
          onTap: () => controller.onPostCardPressed(post)),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text((post.msgCount).formatNumber()))
    ];
    return isHorizontal
        ? Row(
            children: children,
          )
        : Column(
            children: children,
          );
  }
}