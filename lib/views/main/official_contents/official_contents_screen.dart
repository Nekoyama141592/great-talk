import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/chat_constants.dart';
import 'package:great_talk/controllers/official_contents_controller.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/post_card.dart';
import 'package:great_talk/views/main/subscribe/components/plan_description.dart';

class OfficialContentsScreen extends HookWidget {
  const OfficialContentsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OfficialContentsController());
    useEffect(() {
      controller.init();
      return;
    }, []);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            final docs = controller.qDocInfoList;
            if (controller.isLoading.value) {
              return const CircularProgressIndicator();
            } else if (docs.isEmpty) {
              return const SizedBox.shrink();
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: PostCard(qDocInfo: docs.last),
              );
            }
          }),
          const BasicHeightBox(),
          const PlanDescription(text: "数学が得意なAIです"),
          const PlanDescription(text: "正確な計算結果を返せるように独自にプログラムを組んでいます"),
          const PlanDescription(
              text:
                  "この投稿のみ、一度の使用で${ChatConstants.officialPostConsumePoint}回チャットする扱いになります(通常は一度の使用で${ChatConstants.basicPostConsumePoint}回チャットする扱いになります)"),
        ],
      ),
    );
  }
}
