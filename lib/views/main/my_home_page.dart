import 'package:flutter/material.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/bottom_navigation_bar_elements.dart';
import 'package:great_talk/common/others.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/create_post_controller.dart';
import 'package:great_talk/controllers/edit_controller.dart';
import 'package:great_talk/controllers/generate_image_controller.dart';
import 'package:great_talk/controllers/notification_controller.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/controllers/realtime_res_controller.dart';
import 'package:great_talk/views/components/original_drawer.dart';
import 'package:great_talk/views/main/components/main_floating_action_button.dart';
import 'package:great_talk/views/main/feeds/feeds_page.dart';
import 'package:great_talk/views/main/new_posts/new_posts_screen.dart';
import 'package:great_talk/views/main/official_contents/official_contents_screen.dart';
import 'package:great_talk/views/main/ranking/ranking_screen.dart';
import 'package:great_talk/views/main/subscribe/subscribe_screen.dart';
import 'package:great_talk/controllers/purchases_controller.dart';

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});
  @override
  Widget build(context) {
    Get.put(PurchasesController());
    Get.put(NotificationController());
    Get.put(PostsController());
    Get.put(RealtimeResController());
    Get.put(CreatePostController());
    Get.put(EditController());
    Get.put(GenerateImageController());
    final pageIndex = useState(0);
    final PageController pageController = usePageController();
    return Scaffold(
        appBar: pageIndex.value == 1 || pageIndex.value == 4
            ? null
            : AppBar(
                title: BasicBoldText(appName), shape: appBarShape(context)),
        floatingActionButton: MainFloatingActionButton(
            controller: pageController, pageIndex: pageIndex),
        drawer: const OriginalDrawer(),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: bnbElements,
            currentIndex: pageIndex.value,
            onTap: (index) async {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn);
            }),
        body: PageView(
          onPageChanged: (index) => pageIndex.value = index,
          controller: pageController,
          children: const [
            FeedsPage(),
            RankingScreen(),
            OfficialContentsScreen(),
            NewPostsScreen(),
            SubscribeScreen(),
          ],
        ));
  }
}
