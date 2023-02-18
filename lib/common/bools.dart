import 'dart:io';

import 'package:great_talk/flavors.dart';

bool isProd() => F.appFlavor == Flavor.PROD;

bool isIOS() => Platform.isIOS;