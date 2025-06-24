import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:great_talk/views/components/circle_image/components/s3_image.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.base64Image,
    required this.onImageTap,
  });

  final String? base64Image;
  final VoidCallback onImageTap;

  @override
  Widget build(BuildContext context) {
    final uint8list = base64Image != null ? base64Decode(base64Image!) : null;
    
    return uint8list != null
        ? InkWell(
            onTap: onImageTap,
            child: S3Image(uint8list: uint8list, height: 128, width: 128),
          )
        : InkWell(
            onTap: onImageTap, 
            child: const Icon(Icons.image, size: 128),
          );
  }
}