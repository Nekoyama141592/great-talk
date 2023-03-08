import 'package:flutter/material.dart';
import 'package:great_talk/api/in_app_purchase_api.dart';
import 'package:great_talk/api/show_toast.dart';
import 'package:great_talk/api/url_api.dart';
import 'package:great_talk/common/bools.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/widgets.dart';
import 'package:great_talk/views/components/secondary_color_button.dart';
import 'package:great_talk/views/subscribe/components/plan_descriptions.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PolicyButtons extends StatelessWidget {
  const PolicyButtons({Key? key,required this.innerContext,required this.inAppPurchase,required this.planName,required this.productDetails}) : super(key: key);
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
            child: Container(alignment: Alignment.topRight,child: Material(child: InkWell(child: const Icon(Icons.close),onTap: () => Navigator.pop(innerContext),)),),
          ),
          const PlanDescriptions(),
          const Divider(),
          Card(child: ListTile(leading: const Icon(Icons.money),title: boldText(getPlanDescription(productDetails.id,productDetails.price)),),),
          const Divider(),
          const Expanded(child: SizedBox()),
          TextButton(
            onPressed: () async => await UrlApi.toPrivacyPage(),
            child: whiteText('プライバシーポリシー')
          ),
          TextButton(
            onPressed: () async => await UrlApi.toTosPage(),
            child: whiteText(tosText)
          ),
          if(isIOS()) TextButton(
            onPressed: () async => await UrlApi.toEULAPage(),
            child: whiteText('使用許諾契約(EULA)')
          ),
          const Divider(),
          SecondaryColorButton(
            onPressed: () async{
              try {
                await InAppPurchaseApi.onPurchaseButtonPressed(inAppPurchase, productDetails).then((value) => Navigator.pop(innerContext));
              } catch(e) {
                await ShowToast.showFlutterToast("購入前にエラーが発生しました").then((value) => Navigator.pop(context));
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: Text("$planNameを始める",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
            )
          )
        ],
      ),
    );
  }
}