// flutter
import 'package:flutter/material.dart';
// common
import 'package:great_talk/core/util/size_util.dart';

ShapeBorder appBarShape(BuildContext context) => RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(SizeUtil.appBarCircular(context)),
  ),
);
