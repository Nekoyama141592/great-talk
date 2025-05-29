import 'package:flutter/material.dart';
import 'package:great_talk/extensions/number_format_extension.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/providers/logic/router/router_logic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostMsgButton extends ConsumerWidget {
  const PostMsgButton({
    super.key,
    required this.isHorizontal,
    required this.post,
  });
  final bool isHorizontal;
  final Post post;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = [
      InkWell(
        child: const Icon(Icons.comment),
        onTap: () => RouterLogic.toChatPage(context, post),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text((post.msgCount).formatNumber()),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child:
          isHorizontal ? Row(children: children) : Column(children: children),
    );
  }
}
