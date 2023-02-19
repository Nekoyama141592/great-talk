import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:great_talk/common/others.dart';
import 'package:great_talk/controllers/purchases_controller.dart';

import 'package:great_talk/views/components/product_list.dart';
import 'package:great_talk/views/subscribe/components/plan_descriptions.dart';
import 'package:great_talk/views/subscribe/components/restore_buttons.dart';

class SubscribePage extends StatelessWidget {
  const SubscribePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('サブスクリプション'),shape: appBarShape(context),),
      body: SubscribeView()
    );
  }
}


class SubscribeView extends StatelessWidget {
  SubscribeView({Key? key}) : super(key: key);
  final PurchasesController purchasesController = PurchasesController.to;
  @override
  Widget build(BuildContext context) {
    final children = [
      ListView(
        children: const <Widget>[
          PlanDescriptions(),
          ProductList(),
          RestoreButtons()
        ],
      ),
      Obx((() {
        if (purchasesController.purchasePending.value) {
          return Stack(
            children: const <Widget>[
              Opacity(opacity: 0.3, child: ModalBarrier(dismissible: false, color: Colors.grey),),
              Center(child: CircularProgressIndicator(),),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      }))
    ];
    return Stack(children: children);
  }


  
}
