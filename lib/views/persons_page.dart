import 'package:flutter/material.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/controllers/great_persons_controller.dart';
import 'package:great_talk/controllers/professionals_controller.dart';
import 'package:great_talk/common/bottom_navigation_bar_elements.dart';
import 'package:great_talk/common/others.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/common/widgets.dart';
import 'package:great_talk/controllers/main_controller.dart';
import 'package:great_talk/controllers/notification_controller.dart';
import 'package:great_talk/views/components/person_cards.dart';
import 'package:great_talk/views/components/search_screen.dart';
import 'package:great_talk/views/subscribe/subscribe_page.dart';
import 'package:great_talk/controllers/purchases_controller.dart';

class PersonsPage extends HookWidget {
  const PersonsPage({Key? key}) : super(key: key);
  @override
  Widget build(context) {
    final PurchasesController purchasesController =
        Get.put(PurchasesController());
    Get.put(MainController());
    final GreatPersonsController searchController =
        Get.put(GreatPersonsController());
    final ProfessionalsController professionalsController =
        Get.put(ProfessionalsController());
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
            Obx(
              () => searchController.isSearching.value
                  ? SearchScreen(
                      onQueryChanged: (query) => searchController.search(query),
                      child: const PersonCards(isProMode: false),
                    )
                  : const PersonCards(
                      isProMode: false,
                    ),
            ),
            Obx(
              () => professionalsController.isSearching.value
                  ? SearchScreen(
                      onQueryChanged: (query) =>
                          professionalsController.search(query),
                      child: const PersonCards(isProMode: true),
                    )
                  : const PersonCards(
                      isProMode: true,
                    ),
            ),
            SubscribeView()
          ],
        ));
  }
}
