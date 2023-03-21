import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';
// packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:great_talk/common/persons.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.person
  }) : super(key: key);
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
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: person.id == chatGPTId || person.id == wolframId ? DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.fill) : DecorationImage(image: NetworkImage(imageUrl)),
      ),
    );
  }
}