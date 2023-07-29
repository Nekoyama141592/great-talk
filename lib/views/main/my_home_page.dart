import 'package:flutter/material.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/bottom_navigation_bar_elements.dart';
import 'package:great_talk/common/others.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/common/widgets.dart';
import 'package:great_talk/controllers/main_controller.dart';
import 'package:great_talk/controllers/notification_controller.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:great_talk/views/components/person_cards.dart';
import 'package:great_talk/views/components/search_screen.dart';
import 'package:great_talk/views/main/feeds/feeds_screen.dart';
import 'package:great_talk/views/main/my_profile/my_profile_screen.dart';
import 'package:great_talk/views/main/ranking/ranking_screen.dart';
import 'package:great_talk/views/main/subscribe/subscribe_screen.dart';
import 'package:great_talk/controllers/purchases_controller.dart';

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(context) {
    final purchasesController = Get.put(PurchasesController());
    final PersonsController controller = Get.put(PersonsController());
    Get.put(MainController());
    Get.put(NotificationController());
    final pageIndex = useState(0);
    final PageController pageController = usePageController();
    return Scaffold(
        appBar: AppBar(title: boldText(appName), shape: appBarShape(context)),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: bnbElements,
            currentIndex: pageIndex.value,
            onTap: (index) async {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn);
              if (index == 1) await purchasesController.restorePurchases();
            }),
        body: PageView(
          onPageChanged: (index) => pageIndex.value = index,
          controller: pageController,
          children: [
            const FeedsScreen(),
            const RankingScreen(),
            Obx(
              () => controller.isSearching.value
                  ? SearchScreen(
                      onQueryChanged: (query) => controller.search(query),
                      child: const PersonCards(),
                    )
                  : const PersonCards(),
            ),
            SubscribeScreen(),
            const MyProfileScreen()
          ],
        ));
  }
}
