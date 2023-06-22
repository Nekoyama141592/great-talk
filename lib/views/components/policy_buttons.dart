import 'package:flutter/material.dart';
import 'package:great_talk/common/url_redirector.dart';
import 'package:great_talk/common/bools.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/widgets.dart';
import 'package:great_talk/views/subscribe/components/plan_descriptions.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

// 未使用
class PolicyButtons extends StatelessWidget {
  const PolicyButtons(
      {Key? key,
      required this.innerContext,
      required this.inAppPurchase,
      required this.planName,
      required this.productDetails})
      : super(key: key);
  final InAppPurchase inAppPurchase;
  final BuildContext innerContext;
  final String planName;
  final ProductDetails productDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              alignment: Alignment.topRight,
              child: Material(
                  child: InkWell(
                child: const Icon(Icons.close),
                onTap: () => Navigator.pop(innerContext),
              )),
            ),
          ),
          const PlanDescriptions(),
          const Divider(),
          Card(
            child: ListTile(
              leading: const Icon(Icons.money),
              title: boldText(
                  getPlanDescription(productDetails.id, productDetails.price)),
            ),
          ),
          const Divider(),
          const Expanded(child: SizedBox()),
          TextButton(
              onPressed: () async => await UrlRedirector.toPrivacyPage(),
              child: whiteText('プライバシーポリシー')),
          TextButton(
              onPressed: () async => await UrlRedirector.toTosPage(),
              child: whiteText(tosText)),
          if (isIOS())
            TextButton(
                onPressed: () async => await UrlRedirector.toEULAPage(),
                child: whiteText('使用許諾契約(EULA)')),
          const Divider(),
        ],
      ),
    );
  }
}
