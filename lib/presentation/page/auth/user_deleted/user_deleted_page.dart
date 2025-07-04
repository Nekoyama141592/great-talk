import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/presentation/page/screen/svg_and_msg_screen.dart';

@RoutePage()
class UserDeletedPage extends StatelessWidget {
  const UserDeletedPage({super.key});
  static const path = "/userDeleted";
  @override
  Widget build(BuildContext context) {
    return const SvgAndMsgScreen(
      title: "ユーザー削除",
      msg: "ユーザーを削除しました\n\n投稿も全て削除されます\n\nお疲れ様でした",
      svgPath: "assets/svgs/Done-rafiki.svg",
    );
  }
}
