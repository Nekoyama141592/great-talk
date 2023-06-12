import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';
// packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:cached_network_image/cached_network_image.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({Key? key, required this.person}) : super(key: key);
  final types.User person;
  @override
  Widget build(BuildContext context) {
    final imageUrl = person.imageUrl;
    final length = userImageSize(context);
    return imageUrl == null || imageUrl.isEmpty
        ? const Icon(Icons.person)
        : Container(
            width: length,
            height: length,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
       imageUrl: imageUrl,
       progressIndicatorBuilder: (context, url, downloadProgress) => 
               CircularProgressIndicator(value: downloadProgress.progress),
       errorWidget: (context, url, error) => const Icon(Icons.person),
    ),
          );
  }
}
