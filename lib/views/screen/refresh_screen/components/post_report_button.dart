import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/model/post/post.dart';

class PostReportButton extends HookWidget {
  const PostReportButton({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    final controller = PostsController.to;
    return InkWell(
      onTap: () => controller.onReportButtonPressed(context, post),
      child: const Icon(Icons.report),
    );
  }
}
