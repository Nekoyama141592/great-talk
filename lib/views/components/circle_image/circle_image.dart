import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:great_talk/views/components/circle_image/components/s3_image.dart';

class CircleImage extends StatelessWidget {
  const CircleImage(
      {super.key,
      required this.bucketName,
      required this.imageValue,
      this.uint8list,
      this.onTap});
  final String bucketName;
  final String imageValue;
  final Uint8List? uint8list;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    // オリジナルコンテンツかモックデータならURL.その他ならS3のファイル名
    final length = userImageSize(context);
    if (imageValue.isEmpty) {
      return Icon(
        Icons.person,
        size: length,
      );
    }
    if (imageValue.startsWith("https://")) {
      return InkWell(
        onTap: onTap,
        child: SizedBox(
          width: length,
          height: length,
          child: CachedNetworkImage(
            imageBuilder: (context, image) {
              return Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: image, fit: BoxFit.fill)),
              );
            },
            imageUrl: imageValue,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.person),
          ),
        ),
      );
    } else {
      return uint8list == null
          ? const CircularProgressIndicator()
          : S3Image(uint8list: uint8list!);
    }
  }
}
