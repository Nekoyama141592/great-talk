import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/colors.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewPostsScreen extends ConsumerWidget {
  const NewPostsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = Get.put(DocsController(DocsType.newPosts));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onRefresh,
        backgroundColor: kSecondaryColor,
        child: const Icon(Icons.refresh),
      ),
      body: RefreshScreen(
        docsController: controller,
        currentUid: ref.watch(streamAuthUidProvider).value!,
      ),
    );
  }
}
