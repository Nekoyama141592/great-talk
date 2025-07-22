import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:great_talk/presentation/component/circle_image/components/s3_image.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    this.width,
    this.height,
    this.uint8list,
    this.onTap,
  });
  final Uint8List? uint8list;
  final double? width, height;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return uint8list == null
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              size: (width ?? 50) * 0.6,
              color: Colors.grey[600],
            ),
          )
        : S3Image(uint8list: uint8list!, width: width, height: height);
  }
}
