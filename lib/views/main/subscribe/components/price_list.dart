import 'package:flutter/material.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/iap_constants/mock_product_list.dart';

class PriceList extends StatelessWidget {
  const PriceList({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: BasicBoldText("※${getPlanName(myProductList[0].id)}"),
          ),
          ListTile(
            title: BasicBoldText("※${getPlanName(myProductList[1].id)}"),
          ),
        ],
      ),
    );
  }
}
