import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/presentation/component/basic_page.dart';
import 'package:great_talk/presentation/page/main/subscribe/subscribe_screen.dart';

@RoutePage()
class SubscribePage extends StatelessWidget {
  const SubscribePage({super.key});
  static const path = "/subscribe";
  @override
  Widget build(BuildContext context) {
    return const BasicPage(appBarText: "有料プラン", child: SubscribeScreen());
  }
}
