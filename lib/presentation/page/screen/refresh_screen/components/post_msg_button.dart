import 'package:flutter/material.dart';
import 'package:great_talk/core/extension/number_format_extension.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostMsgButton extends ConsumerWidget {
  const PostMsgButton({
    super.key,
    required this.isHorizontal,
    required this.post,
  });
  final bool isHorizontal;
  final PostEntity post;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = [
      InkWell(
        child: const Icon(Icons.comment),
        onTap: () => RouteUtil.toChatPage(context, post),
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
