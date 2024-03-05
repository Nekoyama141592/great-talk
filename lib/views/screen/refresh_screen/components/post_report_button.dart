import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/views/components/app_bar_action.dart';

class PostReportButton extends HookWidget {
  const PostReportButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = PostsController.to;
    return AppBarAction(
      onTap: () => controller.onReportButtonPressed(context),
      child: const Icon(Icons.report),
    );
  }
}
