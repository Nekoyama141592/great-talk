// flutter
import 'package:flutter/material.dart';
// common
import 'package:great_talk/core/size_core.dart';

ShapeBorder appBarShape(BuildContext context) => RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(SizeCore.appBarCircular(context)),
  ),
);
