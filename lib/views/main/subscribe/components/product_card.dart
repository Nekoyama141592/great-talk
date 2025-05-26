import 'package:flutter/material.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/purchase_button.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productDetails,
    required this.descriptions,
  });
  final ProductDetails productDetails;
  final List<Widget> descriptions;
  @override
  Widget build(BuildContext context) {
    final String planName = getPlanName(productDetails.id);
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(color: Theme.of(context).focusColor),
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BasicBoldText(planName),
          const BasicHeightBox(),
          BasicBoldText("${productDetails.price}/月"),
          const BasicHeightBox(),
          ...descriptions,
          PurchaseButton(productDetails: productDetails),
        ],
      ),
    );
  }
}
