import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:great_talk/controllers/purchases_controller.dart';

class RestoreButton extends StatelessWidget {
  const RestoreButton({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = PurchasesController.to;
    return Obx((() {
      return controller.loading.value
          ? Container()
          : Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: controller.onRestoreButtonPressed,
                    child: Text(
                      '購入を復元',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).focusColor),
                    )),
              ));
    }));
  }
}
