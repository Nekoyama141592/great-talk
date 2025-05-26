import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/core/post_core.dart';
import 'package:great_talk/extensions/number_format_extension.dart';
import 'package:great_talk/model/database_schema/post/post.dart';

class PostMsgButton extends HookWidget {
  const PostMsgButton({
    super.key,
    required this.isHorizontal,
    required this.post,
  });
  final bool isHorizontal;
  final Post post;
  @override
  Widget build(BuildContext context) {
    final children = [
      InkWell(
          child: const Icon(
            Icons.comment,
          ),
          onTap: () => PostCore.onPostCardPressed(post)),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text((post.msgCount).formatNumber()))
    ];
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: isHorizontal
          ? Row(
              children: children,
            )
          : Column(
              children: children,
            ),
    );
  }
}
