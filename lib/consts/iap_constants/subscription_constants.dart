import 'package:great_talk/app/flavors.dart';

final isProd = F.appFlavor == Flavor.prod;
final String kWeekSubscriptionId =
    isProd ? 'subscription_week' : "dev_subscription_week";
final String kMonthSubscriptionId =
    isProd ? 'subscription_month' : "dev_subscription_month";
final String kAnnualSubscriptionId =
    isProd ? 'subscription_annual' : "dev_subscription_annual";
final String kPremiumSubscriptionId =
    isProd ? 'premium_month' : "dev_premium_month";
final List<String> kProductIds = <String>[
  kMonthSubscriptionId,
  kPremiumSubscriptionId,
];
