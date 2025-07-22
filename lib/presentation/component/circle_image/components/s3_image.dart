import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:great_talk/core/util/size_util.dart';

class S3Image extends StatelessWidget {
  const S3Image({super.key, this.width, this.height, required this.uint8list});
  final double? width, height;
  final Uint8List uint8list;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: SizedBox(
            width: width ?? SizeUtil.userImageSize(context),
            height: height ?? SizeUtil.userImageSize(context),
            child: Image.memory(
              uint8list,
              fit: BoxFit.cover,
              width: width ?? SizeUtil.userImageSize(context),
              height: height ?? SizeUtil.userImageSize(context),
            ),
          ),
        ),
      ),
    );
  }
}
