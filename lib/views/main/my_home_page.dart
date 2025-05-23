import 'package:flutter/material.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/providers/global/notification/notification_provider.dart';
import 'package:great_talk/views/common/bottom_navigation_bar_elements.dart';
import 'package:great_talk/ui_core/others.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/controllers/create_post_controller.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/controllers/chat_controller.dart';
import 'package:great_talk/views/components/original_drawer.dart';
import 'package:great_talk/views/main/components/main_floating_action_button.dart';
import 'package:great_talk/views/main/feeds/feeds_page.dart';
import 'package:great_talk/views/main/new_posts/new_posts_screen.dart';
import 'package:great_talk/views/main/ranking/ranking_screen.dart';
import 'package:great_talk/views/main/subscribe/subscribe_screen.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Get.put(PurchasesController());
    ref.watch(notificationProvider);
    Get.put(PostsController());
    Get.put(ChatController());
    Get.put(CreatePostController());
    final pageIndex = useState(0);
    final PageController pageController = usePageController();
    return Scaffold(
        appBar: pageIndex.value == rankingIndex
            ? null
            : AppBar(
                title: BasicBoldText(appName), shape: appBarShape(context)),
        floatingActionButton: MainFloatingActionButton(
          isShow:
              pageIndex.value == rankingIndex || pageIndex.value == feedsIndex,
        ),
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
            RankingScreen(),
            FeedsPage(),
            NewPostsScreen(),
            SubscribeScreen(),
          ],
        ));
  }
}
