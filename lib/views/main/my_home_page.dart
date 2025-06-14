import 'package:flutter/material.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/provider/keep_alive/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/provider/keep_alive/notification/notification_provider.dart';
import 'package:great_talk/provider/keep_alive/notifier/purchases/purchases_notifier.dart';
import 'package:great_talk/provider/view_model/products/products_view_model.dart';
import 'package:great_talk/ui_core/flavor_ui_core.dart';
import 'package:great_talk/views/common/bottom_navigation_bar_elements.dart';
import 'package:great_talk/ui_core/others.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/views/components/original_drawer.dart';
import 'package:great_talk/views/main/components/main_floating_action_button.dart';
import 'package:great_talk/views/main/feeds/feeds_page.dart';
import 'package:great_talk/views/main/new_posts/new_posts_screen.dart';
import 'package:great_talk/views/main/ranking/ranking_screen.dart';
import 'package:great_talk/views/main/subscribe/subscribe_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(currentUserNotifierProvider);
    ref.watch(purchasesNotifierProvider);
    ref.watch(productsViewModelProvider);
    ref.watch(notificationProvider);
    final pageIndex = useState(0);
    final PageController pageController = usePageController();
    return Scaffold(
      appBar:
          pageIndex.value != rankingIndex
              ? AppBar(
                title: BasicBoldText(FlavorUiCore.appName()),
                shape: appBarShape(context),
              )
              : null,
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
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
          );
        },
      ),
      body: PageView(
        onPageChanged: (index) => pageIndex.value = index,
        controller: pageController,
        children: const [
          RankingScreen(),
          FeedsPage(),
          NewPostsScreen(),
          SubscribeScreen(),
        ],
      ),
    );
  }
}
