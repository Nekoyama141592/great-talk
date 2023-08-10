import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:great_talk/views/screen/refresh_screen/components/s3_image.dart';

class CircleImage extends StatelessWidget {
  const CircleImage(
      {Key? key,
      required this.bucketName,
      required this.imageValue,
      this.onTap})
      : super(key: key);
  final String bucketName;
  final String imageValue;
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
    return imageValue.startsWith("https://")
        ? InkWell(
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
          )
        : S3Image(bucketName: bucketName, fileName: imageValue);
  }
}
