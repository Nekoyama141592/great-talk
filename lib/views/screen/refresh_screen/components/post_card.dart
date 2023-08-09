import 'package:flutter/material.dart';
import 'package:great_talk/model/chat_content/chat_content.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_like_button.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_report_button.dart';

class PostCard extends StatelessWidget {
  const PostCard(
      {Key? key,
      required this.chatContent,
      required this.post,
      required this.onTap})
      : super(key: key);
  final ChatContent chatContent;
  final Post post;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CircleImage(imageValue: chatContent.imageValue),
          const Spacer(),
          Text(post.typedTitle().value),
          const Spacer(),
          PostLikeButton(
            post: post,
          ),
          PostReportButton(post: post)
        ],
      ),
    );
  }
}
