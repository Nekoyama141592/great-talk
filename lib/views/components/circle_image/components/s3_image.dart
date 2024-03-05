import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';

class S3Image extends StatelessWidget {
  const S3Image({super.key, required this.uint8list});
  final Uint8List uint8list;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: userImageSize(context),
        height: userImageSize(context),
        child: Align(
          alignment: Alignment.center,
          child: Image.memory(uint8list),
        ),
      ),
    );
  }
}
