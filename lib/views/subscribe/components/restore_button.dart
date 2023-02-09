import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class RestoreButton extends StatelessWidget {
  const RestoreButton({Key? key,required this.loading,required this.inAppPurchase}) : super(key: key);
  final bool loading;
  final InAppPurchase inAppPurchase;
  @override 
  Widget build(BuildContext context) {
    if (loading) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: () => inAppPurchase.restorePurchases(),
            child: const Text('購入を復元',style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
    );
  }
}