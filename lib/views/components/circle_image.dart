import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';
// packages
import 'package:cached_network_image/cached_network_image.dart';
import 'package:great_talk/model/chat_user/chat_user.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({Key? key, required this.interlocutor}) : super(key: key);
  final ChatUser interlocutor;
  @override
  Widget build(BuildContext context) {
    final imageUrl = interlocutor.imageUrl;
    final length = userImageSize(context);
    return imageUrl.isEmpty
        ? const Icon(Icons.person)
        : SizedBox(
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
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.person),
            ),
          );
  }
}
