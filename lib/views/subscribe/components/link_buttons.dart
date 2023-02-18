import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:great_talk/api/url_api.dart';
import 'package:great_talk/common/bools.dart';
import 'package:great_talk/common/widgets.dart';
import 'package:great_talk/controllers/purchases_controller.dart';

class LinkButtons extends StatelessWidget {
  const LinkButtons({Key? key,}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    final controller = PurchasesController.to;
    return Obx((() {
      return controller.loading.value
      ? Container()
      : Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: () async => await UrlApi.toPrivacyPage(),
              child: blackText('プライバシーポリシー')
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(isIOS()) TextButton(
                  onPressed: () async => await UrlApi.toEULAPage(),
                  child: blackText('使用許諾契約(EULA)')
                ),
                TextButton(
                  onPressed: () async => await controller.restorePurchases(),
                  child: blackText('購入を復元')
                ),
              ],
            )
          ],
        ),
      );
    }));
  }
}