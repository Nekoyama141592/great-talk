import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_talk/common/url_redirector.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/views/main/subscribe/components/price_list.dart';

import 'package:great_talk/views/main/subscribe/components/product_list.dart';
import 'package:great_talk/views/main/subscribe/components/policy_button.dart';
import 'package:great_talk/views/main/subscribe/components/restore_button.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PurchasesController purchasesController = PurchasesController.to;
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProductList(),
          const RestoreButton(),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const PolicyButton(
                  label: 'プライバシーポリシー',
                  onPressed: UrlRedirector.toPrivacyPage,
                ),
                const PolicyButton(
                  label: '利用規約',
                  onPressed: UrlRedirector.toTosPage,
                ),
                if (Platform.isIOS)
                  const PolicyButton(
                    label: 'EULA',
                    onPressed: UrlRedirector.toEULAPage,
                  ),
              ],
            ),
          ),
          if (Platform.isAndroid && purchasesController.products.isEmpty)
            const PriceList(),
        ],
      ),
    );
  }
}
