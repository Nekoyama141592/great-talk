import 'package:flutter/material.dart';
import 'package:great_talk/core/util/size_util.dart';
import 'package:great_talk/presentation/constant/tab_constant.dart';
import 'package:great_talk/presentation/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/core/provider/keep_alive/notification/notification_provider.dart';
import 'package:great_talk/presentation/notifier/products/products_notifier.dart';
import 'package:great_talk/presentation/notifier/purchases/purchases_notifier.dart';
import 'package:great_talk/presentation/util/flavor_ui_util.dart';
import 'package:great_talk/presentation/page/common/bottom_navigation_bar_elements.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/presentation/util/texts.dart';
import 'package:great_talk/presentation/component/original_drawer.dart';
import 'package:great_talk/presentation/page/main/components/main_floating_action_button.dart';
import 'package:great_talk/presentation/page/main/feeds/feeds_page.dart';
import 'package:great_talk/presentation/page/main/new_posts/new_posts_screen.dart';
import 'package:great_talk/presentation/page/main/post_ranking_screen.dart';
import 'package:great_talk/presentation/page/main/user_ranking_screen.dart';
import 'package:great_talk/presentation/page/main/subscribe/subscribe_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(currentUserNotifierProvider);
    ref.watch(purchasesNotifierProvider);
    ref.watch(productsNotifierProvider);
    ref.watch(notificationProvider);
    final pageIndex = useState(0);
    final pageController = usePageController();
    return Scaffold(
      appBar: AppBar(
        title: BasicBoldText(FlavorUiUtil.appName()),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(SizeUtil.appBarCircular(context)),
          ),
        ),
      ),
      floatingActionButton: MainFloatingActionButton(
        isShow: pageIndex.value != TabConstant.subscriveIndex,
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
          PostRankingScreen(),
          UserRankingScreen(),
          FeedsPage(),
          NewPostsScreen(),
          SubscribeScreen(),
        ],
      ),
    );
  }
}
