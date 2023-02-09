import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_talk/api/chat_api.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/widgets.dart';

class PlanDescriptions extends StatelessWidget {
  const PlanDescriptions({Key? key,required this.loading}) : super(key: key);
  final bool loading;
  @override
  Widget build(BuildContext context) {
    if (loading) { return const Card(child: ListTile(title: Text('情報を取得しています'))); }
    final storeStr = Platform.isIOS ? "App Store" : "Google Play Store";
    final children = [
      ListTile(
        leading: const Icon(Icons.check),
        title: boldText('無料プランではチャットは1日${ChatApi.chatLimitPerDay}回!')
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.check,color: kSecondaryColor,),
        title: boldText('登録するとチャット回数が無制限！')
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.check,color: kSecondaryColor,),
        title: boldText("$storeStr からいつでもキャンセル可能！")
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.sentiment_very_dissatisfied),
        title: boldText("（実は開発者が1チャットあたり2円ほど負担してます...）")
      ),
    ];
    return Card(child: Column(children: children));
  }
}