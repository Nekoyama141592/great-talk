import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/realtime_res_controller.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/rounded_button.dart';

class BookmarkCategoriesListView extends StatelessWidget {
  const BookmarkCategoriesListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = RealtimeResController.to;
    // dialogで表示するので高さが必要
    return SizedBox(
        height: fullHeight(context) * 0.8,
        child: Padding(
          padding: EdgeInsets.all(defaultPadding(context)),
          child: Column(
            children: [
              SizedBox(
                height: fullHeight(context) * 0.7,
                child: Material(
                    child: Obx(
                  () => ListView.builder(
                    itemCount:
                        CurrentUserController.to.bookmarkCategoryTokens.length,
                    itemBuilder: (context, index) {
                      final token = CurrentUserController
                          .to.bookmarkCategoryTokens[index];
                      return InkWell(
                          onTap: () =>
                              controller.onBookmarkCategoryTapped(token),
                          child: ListTile(
                            title: BasicBoldText(token.title),
                          ));
                    },
                  ),
                )),
              ),
              const BasicHeightBox(),
              RoundedButton(text: cancelText, press: Get.back),
            ],
          ),
        ));
  }
}
