import 'package:flutter/material.dart';
import 'package:great_talk/presentation/constant/colors.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/presentation/page/create_post/create_post_page.dart';

class MainFloatingActionButton extends StatelessWidget {
  const MainFloatingActionButton({super.key, required this.isShow});
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    if (isShow) {
      return FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () => RouteUtil.pushPath(context, CreatePostPage.path),
        child: const Icon(Icons.new_label),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
