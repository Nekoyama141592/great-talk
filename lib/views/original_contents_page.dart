import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:great_talk/views/components/original_content_cards.dart';
import 'package:great_talk/views/screen/search_screen.dart';

class OriginalContentsPage extends StatelessWidget {
  const OriginalContentsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PersonsController controller = Get.put(PersonsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("公式コンテンツ"),
      ),
      body: Obx(
        () => controller.isSearching.value
            ? SearchScreen(
                hint: "例: 織田信長",
                onQueryChanged: (query) => controller.search(query),
                child: const OriginalContentCards(),
              )
            : const OriginalContentCards(),
      ),
    );
  }
}
