import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
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
            if (docs.isEmpty) {
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
        ],
      ),
    );
  }
}
