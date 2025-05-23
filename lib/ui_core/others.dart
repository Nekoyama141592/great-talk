// flutter
import 'package:flutter/material.dart';
// common
import 'package:great_talk/core/doubles.dart';

ShapeBorder appBarShape(BuildContext context) => RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(appBarCircular(context))));
