import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/views/components/rounded_button.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchaseButton extends StatelessWidget {
  const PurchaseButton({Key? key, required this.productDetails})
      : super(key: key);
  final ProductDetails productDetails;
  @override
  Widget build(BuildContext context) {
    final controller = PurchasesController.to;
    const textColor = Colors.white;
    return Obx(() => controller.hasProductBeenPurchased(productDetails)
        ? RoundedButton(
            textColor: textColor,
            buttonColor: Colors.grey.withOpacity(0.8),
            text: "契約中",
          )
        : RoundedButton(
            textColor: textColor,
            buttonColor: kSecondaryColor,
            text: "契約する",
            press: () async =>
                await controller.onPurchaseButtonPressed(productDetails),
          ));
  }
}
