import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/views/components/user_card.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserRankingScreen extends ConsumerWidget {
  const UserRankingScreen({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = Get.put(DocsController(DocsType.rankingUsers));
    return Obx(() => RefreshScreen(
      currentUid: ref.watch(streamAuthUidProvider).value!,
        docsController: controller,
        child: ListView.builder(
            itemCount: controller.state.value.qDocInfoList.length,
            itemBuilder: (c, i) {
              final publicUser =
                  PublicUser.fromJson(controller.state.value.qDocInfoList[i].qDoc.data());
              final uint8list = controller.state.value.qDocInfoList[i].userImage;
              return UserCard(publicUser: publicUser, uint8list: uint8list);
            })));
  }
}
