import 'package:flutter/material.dart';
import 'dart:convert';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.base64,
    required this.onImageTap,
  });

  final String? base64;
  final VoidCallback onImageTap;

  @override
  Widget build(BuildContext context) {
    final bool hasImage = base64 != null && base64!.isNotEmpty;
    return InkWell(
      onTap: onImageTap,
      child: SizedBox(
        height: 128,
        width: 128,
        child: ClipOval(
          child:
              hasImage
                  ? Image.memory(
                    base64Decode(base64!),
                    fit: BoxFit.cover,
                    width: 128,
                    height: 128,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.person,
                          size: 64,
                          color: Colors.grey,
                        ),
                      );
                    },
                  )
                  : Container(
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      size: 64,
                      color: Colors.grey,
                    ),
                  ),
        ),
      ),
    );
  }
}
