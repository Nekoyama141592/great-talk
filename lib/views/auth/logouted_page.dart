import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/views/screen/svg_and_msg_screen.dart';

@RoutePage()
class LogoutedPage extends StatelessWidget {
  const LogoutedPage({super.key});
  static const path = "/logouted";
  @override
  Widget build(BuildContext context) {
    return const SvgAndMsgScreen(
      title: "ログアウト",
      msg: "ログアウトしました\n\nお疲れ様でした",
      svgPath: "assets/svgs/coffee_break_pana.svg",
    );
  }
}
