import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/views/main/subscribe/components/policy_buttons.dart';
import 'package:great_talk/views/main/subscribe/components/price_list.dart';

import 'package:great_talk/views/main/subscribe/components/product_list.dart';
import 'package:great_talk/views/main/subscribe/components/restore_button.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final PurchasesController purchasesController = PurchasesController.to;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const PolicyButtons(),
            const RestoreButton(),
            const ProductList(),
            if (Platform.isAndroid && purchasesController.products.isEmpty)
              const PriceList(),
          ],
        ),
      ),
    );
  }
}
