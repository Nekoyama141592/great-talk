import 'package:flutter/material.dart';
import 'package:great_talk/common/widgets.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/iap_constants/subscription_constants.dart';

class PriceList extends StatelessWidget {
  const PriceList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: boldText(
                "※年額プランは、${getPlanDescription(kAnnualSubscriptionId, "¥$kAnnualPrice")}"),
          ),
          ListTile(
            title: boldText(
                "※月額プランは、${getPlanDescription(kMonthSubscriptionId, "¥$kMonthPrice")}"),
          ),
          ListTile(
            title: boldText(
                "※週額プランは、${getPlanDescription(kWeekSubscriptionId, "¥$kWeekPrice")}"),
          )
        ],
      ),
    );
  }
}