import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.imageUrl
  }) : super(key: key);
  final String imageUrl;
  @override 
  Widget build(BuildContext context) {
    final image = NetworkImage(imageUrl);
    final length = userImageSize(context);
    return Container(
      width: length,
      height: length,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: image),
      ),
    );
  }
}