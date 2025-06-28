import 'package:flutter/material.dart';
import 'package:great_talk/core/util/size_util.dart';
import 'package:great_talk/presentation/page/common/ranking_tab_bar_elements.dart';
import 'package:great_talk/presentation/page/main/ranking/components/post_ranking_screen.dart';
import 'package:great_talk/presentation/page/main/ranking/components/user_ranking_screen.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: rankingTBE.length,
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(SizeUtil.defaultPadding(context) * 2),
            ),
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs:
                rankingTBE
                    .map((tabBarElement) => Tab(text: tabBarElement.title))
                    .toList(),
          ),
        ),
        body: const TabBarView(
          children: [
            PostRankingScreen(),
            UserRankingScreen(),
            // SearchUsersScreen()
          ],
        ),
      ),
    );
  }
}
