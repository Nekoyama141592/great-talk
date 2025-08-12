import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/core/util/size_util.dart';
import 'package:shimmer/shimmer.dart';

class S3Image extends StatelessWidget {
  const S3Image({
    super.key,
    this.width,
    this.height,
    required this.isModerated,
    required this.imageUrl,
  });

  final double? width, height;
  final bool isModerated;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final double imageSize = width ?? SizeUtil.userImageSize(context);

    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: SizedBox(
            width: imageSize,
            height: imageSize,
            child:
                isModerated
                    ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      width: imageSize,
                      height: imageSize,
                      placeholder:
                          (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.white,
                              child: Icon(
                                Icons.person,
                                size: imageSize * 0.6,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                      errorWidget:
                          (context, url, error) => Container(
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.person,
                              size: imageSize * 0.6,
                              color: Colors.grey[600],
                            ),
                          ),
                    )
                    : Icon(
                      Icons.person,
                      size: imageSize * 0.6,
                      color: Colors.grey[600],
                    ),
          ),
        ),
      ),
    );
  }
}
