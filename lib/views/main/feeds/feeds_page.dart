import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedsPage extends ConsumerWidget {
  const FeedsPage({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = Get.put(DocsController(DocsType.feeds));
    return RefreshScreen(
      docsController: controller,
      reloadMsg: "まずは、右下のボタンから投稿を作成してみましょう！",
      currentUid: ref.watch(streamAuthUidProvider).value!,
    );
  }
}
