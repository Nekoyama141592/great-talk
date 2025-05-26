import 'package:flutter/material.dart';
import 'package:great_talk/core/doubles.dart';
import 'package:great_talk/views/common/ranking_tab_bar_elements.dart';
import 'package:great_talk/views/main/ranking/components/post_ranking_screen.dart';
import 'package:great_talk/views/main/ranking/components/user_ranking_screen.dart';

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
              bottom: Radius.circular(defaultPadding(context) * 2),
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
