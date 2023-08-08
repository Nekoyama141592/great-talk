import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/utility/file_utility.dart';

class S3Image extends HookWidget {
  const S3Image({Key? key, required this.fileName}) : super(key: key);
  final String fileName;
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Uint8List?> uint8List = useState(null);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        uint8List.value = await FileUtility.getS3Image(fileName);
      });
      return;
    }, []);
    return uint8List.value == null
        ? const CircularProgressIndicator()
        : Align(
            alignment: Alignment.center,
            child: Image.memory(uint8List.value!),
          );
  }
}
