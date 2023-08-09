import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/consts/debug_constants.dart';
import 'package:great_talk/model/chat_content/chat_content.dart';
import 'package:great_talk/views/screen/refresh_screen/components/s3_image.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({Key? key, required this.chatContent}) : super(key: key);
  final ChatContent chatContent;
  @override
  Widget build(BuildContext context) {
    final imageValue =
        chatContent.imageValue; // オリジナルコンテンツかモックデータならURL.その他ならS3のファイル名
    final length = userImageSize(context);
    final isOriginalContent = returnIsOriginalContents(chatContent.posterUid);
    return isOriginalContent || isUseMockData
        ? SizedBox(
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
          )
        : S3Image(fileName: imageValue);
  }
}
