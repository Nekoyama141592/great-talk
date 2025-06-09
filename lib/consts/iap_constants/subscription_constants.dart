import 'package:great_talk/core/env_core.dart';

final String kWeekSubscriptionId =
    EnvCore.isProd() ? 'subscription_week' : "dev_subscription_week";
final String kMonthSubscriptionId =
    EnvCore.isProd() ? 'subscription_month' : "dev_subscription_month";
final String kAnnualSubscriptionId =
    EnvCore.isProd() ? 'subscription_annual' : "dev_subscription_annual";
final String kPremiumSubscriptionId =
    EnvCore.isProd() ? 'premium_month' : "dev_premium_month";
final List<String> kProductIds = <String>[
  kMonthSubscriptionId,
  kPremiumSubscriptionId,
];
