import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

class RouterLogic {
  static void pushPath(BuildContext context,String path) {
    context.router.pushPath(path);
  }
  static void back(BuildContext context) {
    context.router.back();
  }
}
