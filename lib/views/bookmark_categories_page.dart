import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/core/doubles.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/views/bookmarks_page.dart';
import 'package:great_talk/views/components/basic_page.dart';
import 'package:great_talk/views/components/rounded_input_field.dart';

class BookmarkCategoriesPage extends HookWidget {
  const BookmarkCategoriesPage({super.key});
  static const path = "/bookmarkCategory";
  @override
  Widget build(BuildContext context) {
    final inputController = useTextEditingController();
    final controller = CurrentUserController.to;
    return BasicPage(
        appBarText: "ブックマークカテゴリー",
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Obx(() => SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: fullHeight(context) * 0.7,
                      child: ListView.builder(
                          itemCount: controller.bookmarkCategoryTokens.length,
                          itemBuilder: (context, index) {
                            final category =
                                controller.bookmarkCategoryTokens[index];
                            return ListTile(
                              onTap: () => Get.toNamed(
                                  BookmarksPage.generatePath(category.id)),
                              title: Text(category.title),
                              trailing: InkWell(
                                onTap: () => controller
                                    .onBookmarkCategoryDeleteButtonPressed(
                                        category),
                                child: const Icon(Icons.delete),
                              ),
                            );
                          }),
                    ),
                    RoundedInputField(
                        controller: inputController,
                        send: () => controller.createBookmarkCategory(
                            context, inputController))
                  ],
                ),
              )),
        ));
  }
}
