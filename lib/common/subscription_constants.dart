// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';


// Auto-consume must be true on iOS.
// To try without auto-consume on another platform, change `true` to `false` here.
final bool kAutoConsume = Platform.isIOS || true;
const String kMonthSubscriptionId = 'subscription_month';
const String kAnnualSubscriptionId = 'subscription_annual';
const List<String> kProductIds = <String>[
  kMonthSubscriptionId,
  kAnnualSubscriptionId,
];

