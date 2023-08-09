import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/widgets.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:great_talk/utility/chat_utility.dart';
import 'package:great_talk/views/components/circle_image.dart';

class OriginalContentCards extends StatelessWidget {
  const OriginalContentCards({Key? key}) : super(key: key);
  @override
  Widget build(context) {
    final PersonsController controller = PersonsController.to;
    return Scaffold(
        floatingActionButton: Obx(
          () => FloatingActionButton(
            onPressed: () {
              controller.isSearching.value = !controller.isSearching.value;
              controller.reset();
            },
            backgroundColor: kPrimaryColor,
            child: controller.isSearching.value
                ? const Icon(Icons.search_off)
                : const Icon(Icons.search),
          ),
        ),
        body: Obx(() => Container(
              padding: controller.isSearching.value
                  ? EdgeInsets.symmetric(vertical: defaultPadding(context) * 7)
                  : null,
              child: Obx(() => ListView.builder(
                  itemCount: controller.results.length,
                  itemBuilder: ((context, index) {
                    final content = controller.results[index];
                    final String name = getName(content);
                    final String? lastAnswer =
                        mapMetadataToLastAnswer(content.metadata);
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: defaultPadding(context)),
                      child: ListTile(
                        leading: CircleImage(imageValue: content.imageValue),
                        title: boldText(name),
                        subtitle: lastAnswer != null
                            ? Text(
                                lastAnswer,
                                overflow: TextOverflow.ellipsis,
                              )
                            : null,
                        onTap: () => Get.toNamed(
                            '/chat/users/${content.posterUid}/posts/${content.contentId}'),
                        onLongPress: () => ChatUtility.showCleanLocalMsgDialog(
                            content, controller),
                      ),
                    );
                  }))),
            )));
  }
}
