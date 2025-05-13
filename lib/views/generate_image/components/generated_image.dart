import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class GeneratedImage extends StatelessWidget {
  const GeneratedImage({super.key, required this.base64});
  final String base64;

  @override
  Widget build(BuildContext context) {
    final Uint8List imageBytes = base64Decode(base64);

    return Image.memory(
      imageBytes,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Text('画像の読み込みに失敗しました'),
        );
      },
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
          child: child,
        );
      },
    );
  }
}
