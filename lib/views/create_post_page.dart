import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_image.dart';

class CreatePostPage extends HookWidget {
  const CreatePostPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Uint8List?> uint8List = useState(null);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        uint8List.value = await FileUtility.getS3Image("logo2.png");
      });
      return;
    }, []);
    return Scaffold(
        appBar: AppBar(
          title: const Text("投稿を作成"),
        ),
        body: const PostImage(fileName: "logo2.png"));
  }
}
