import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/controllers/purchases_controller.dart';

class PlanDescriptions extends StatelessWidget {
  const PlanDescriptions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final storeStr = Platform.isIOS ? "App Store" : "Google Play Store";
    final children = [
      const ListTile(
          leading: Icon(Icons.check),
          title: Text('無料プランではチャットは1日$chatLimitPerDay回!')),
      const Divider(),
      const ListTile(
          leading: Icon(
            Icons.check,
            color: kSecondaryColor,
          ),
          title: Text('登録するとチャット回数が無制限！')),
      const Divider(),
      const ListTile(
          leading: Icon(
            Icons.check,
            color: kSecondaryColor,
          ),
          title: Text('テキストがコピー可能に！!')),
      const Divider(),
      ListTile(
          leading: const Icon(
            Icons.check,
            color: kSecondaryColor,
          ),
          title: Text("$storeStr からいつでもキャンセルできます")),
      const Divider(),
      const ListTile(
          leading: Icon(
            Icons.check,
            color: kSecondaryColor,
          ),
          title: Text("購入したその日に課金されます")),
    ];
    return Obx((() => PurchasesController.to.loading.value
        ? const Card(child: ListTile(title: Text('情報を取得しています')))
        : Card(child: Column(children: children))));
  }
}
