// flutter
import 'package:flutter/material.dart';
import 'package:great_talk/api/search_api.dart';
import 'package:great_talk/common/bottom_navigation_bar_elements.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/others.dart';
// common
import 'package:great_talk/common/persons.dart';
// packages
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/common/widgets.dart';
import 'package:great_talk/flavors.dart';
import 'package:great_talk/views/components/person_cards.dart';
import 'package:great_talk/views/components/search_screen.dart';
import 'package:great_talk/views/subscribe/subscribe_page.dart';
import 'package:great_talk/controllers/purchases_controller.dart';

class PersonsPage extends HookWidget {
  const PersonsPage({Key? key}) : super(key: key);
  @override
  Widget build(context) {
    // このページでPurchasesContollerを使用する場合は、以下の式をpurchasesに代入する.
    Get.put(PurchasesController());
    final results = useState(fullPersons);
    final isSearching = useState(false);
    final pageIndex = useState(0);
    final PageController pageController = usePageController();
    return Scaffold(
      appBar: AppBar(
        title: boldText(F.title),
        shape: appBarShape(context)
      ),
      floatingActionButton:
      FloatingActionButton(
        onPressed: () {
          isSearching.value = !isSearching.value;
          results.value = fullPersons;
        },
        backgroundColor: kPrimaryColor,
        child: isSearching.value ? const Icon(Icons.search_off) : const Icon(Icons.search),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bnbElements,
        currentIndex: pageIndex.value,
        onTap: (index) => pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn)
      ),
      body: PageView(
        onPageChanged: (index) => pageIndex.value = index,
        controller: pageController,
        children: [
          isSearching.value ?
          SearchScreen(
            results: results,
            onQueryChanged: (query) {
              results.value = SearchApi.search(results, query);
            } ,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: defaultPadding(context)*7),
              child: PersonCards(persons: results.value,),
            ),
          ) : const PersonCards(persons: fullPersons),
          const SubscribeView()
        ],
      )
    );
  }
}