import 'package:great_talk/core/bools.dart';

final String kWeekSubscriptionId =
    EnvironmentChecker.isProd() ? 'subscription_week' : "dev_subscription_week";
final String kMonthSubscriptionId =
    EnvironmentChecker.isProd()
        ? 'subscription_month'
        : "dev_subscription_month";
final String kAnnualSubscriptionId =
    EnvironmentChecker.isProd()
        ? 'subscription_annual'
        : "dev_subscription_annual";
final String kPremiumSubscriptionId =
    EnvironmentChecker.isProd() ? 'premium_month' : "dev_premium_month";
final List<String> kProductIds = <String>[
  kMonthSubscriptionId,
  kPremiumSubscriptionId,
];
