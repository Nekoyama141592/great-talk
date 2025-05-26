import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/views/components/circle_image/circle_image.dart';

class MutePostCard extends StatelessWidget {
  const MutePostCard({super.key, required this.post, required this.uint8list,required this.onTap});
  final Post post;
  final Uint8List? uint8list;
  final void Function(Post) onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleImage(
        uint8list: uint8list,
      ),
      title: EllipsisText(
        post.typedTitle().value,
      ),
      onTap: () => onTap,
    );
  }
}
