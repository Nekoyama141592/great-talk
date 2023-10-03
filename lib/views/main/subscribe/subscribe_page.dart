import 'package:flutter/material.dart';
import 'package:great_talk/views/components/basic_page.dart';
import 'package:great_talk/views/main/subscribe/subscribe_screen.dart';

class SubscribePage extends StatelessWidget {
  const SubscribePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const BasicPage(appBarText: "有料プラン", child: SubscribeScreen());
  }
}
