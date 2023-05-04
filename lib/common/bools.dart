import 'dart:io';

import 'package:great_talk/flavors.dart';

bool isProd() => F.appFlavor == Flavor.prod;

bool isIOS() => Platform.isIOS;

bool isAndroid() => Platform.isAndroid;
