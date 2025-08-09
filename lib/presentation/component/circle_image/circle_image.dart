import 'package:flutter/material.dart';
import 'package:great_talk/presentation/component/circle_image/components/s3_image.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    this.width,
    this.height,
    this.imageUrl,
    required this.isModerated,
    this.onTap,
  });
  final String? imageUrl;
  final bool isModerated;
  final double? width, height;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return imageUrl == null || imageUrl!.isEmpty
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
        : S3Image(
          isModerated: isModerated,
          imageUrl: imageUrl!,
          width: height ?? width,
          height: height,
        );
  }
}
