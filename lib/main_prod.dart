import 'package:flutter/material.dart';
import 'package:great_talk/run_app_api.dart';
import 'app.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.PROD;
  RunAppApi.runGreatTalk(F.appFlavor!);
}
