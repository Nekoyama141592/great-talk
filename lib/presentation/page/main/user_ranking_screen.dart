import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:great_talk/presentation/notifier/ranking_users/ranking_users_view_model.dart';
import 'package:great_talk/presentation/page/screen/refresh_screen/users_refresh_screen.dart';
import 'package:great_talk/presentation/component/circle_image/circle_image.dart';
import 'package:great_talk/presentation/component/user_ranking_skeleton.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/presentation/page/user_profile_page.dart';
import 'package:great_talk/presentation/constant/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserRankingScreen extends ConsumerWidget {
  const UserRankingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(rankingUsersViewModelProvider);
    final notifier = ref.read(rankingUsersViewModelProvider.notifier);
    
    return asyncValue.when(
      data: (state) {
        final imageUsers = state.imageUsers;
        return UsersRefreshScreen(
          isEmpty: imageUsers.isEmpty,
          onLoading: notifier.onLoading,
          child: Container(
            decoration: const BoxDecoration(
              color: kContentColorDarkTheme,
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: kPrimaryColor.withValues(alpha: 0.3),
                                  width: 1,
                                ),
                              ),
                              child: const Icon(
                                Icons.leaderboard,
                                color: kPrimaryColor,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'User Ranking',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                  Text(
                                    'Top users by followers',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white.withValues(alpha: 0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        if (imageUsers.isNotEmpty) ..._buildPodiumSection(context, imageUsers),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index >= imageUsers.length) return null;
                      final imageUser = imageUsers[index];
                      final publicUser = imageUser.user;
                      final base64 = imageUser.base64;
                      final uint8list = base64 != null ? base64Decode(base64) : null;
                      
                      if (publicUser == null) return const SizedBox.shrink();
                      
                      return _buildRankingCard(
                        context,
                        publicUser,
                        uint8list,
                        index + 1,
                      );
                    },
                    childCount: imageUsers.length,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => Container(
        decoration: const BoxDecoration(
          color: kContentColorDarkTheme,
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 64,
              ),
              SizedBox(height: 16),
              Text(
                'Failed to load ranking',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      loading: () => const UserRankingSkeleton(),
    );
  }
  
  List<Widget> _buildPodiumSection(BuildContext context, List imageUsers) {
    return [
      Container(
        height: 200,
        margin: const EdgeInsets.only(bottom: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // 2nd place
            if (imageUsers.length > 1) _buildPodiumItem(context, imageUsers[1], 2, 140),
            const SizedBox(width: 8),
            // 1st place
            if (imageUsers.isNotEmpty) _buildPodiumItem(context, imageUsers[0], 1, 180),
            const SizedBox(width: 8),
            // 3rd place
            if (imageUsers.length > 2) _buildPodiumItem(context, imageUsers[2], 3, 120),
          ],
        ),
      ),
    ];
  }
  
  Widget _buildPodiumItem(BuildContext context, dynamic imageUser, int rank, double height) {
    final publicUser = imageUser.user;
    final base64 = imageUser.base64;
    final uint8list = base64 != null ? base64Decode(base64) : null;
    
    if (publicUser == null) return const SizedBox();
    
    const colors = {
      1: kPrimaryColor,
      2: Color(0xFF64B5F6),
      3: Color(0xFFFFB74D),
    };
    
    return Expanded(
      child: GestureDetector(
        onTap: () => RouteUtil.pushPath(
          context,
          UserProfilePage.generatePath(publicUser.uid),
        ),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: kContentColorDarkTheme.withValues(alpha: 0.8),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            border: Border.all(
              color: colors[rank]!.withValues(alpha: 0.3),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: colors[rank]!.withValues(alpha: 0.2),
                blurRadius: 15,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: colors[rank],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      rank.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: rank == 1 ? 10 : 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: CircleImage(
                    uint8list: uint8list,
                    width: rank == 1 ? 55 : 40,
                    height: rank == 1 ? 55 : 40,
                  ),
                ),
                SizedBox(height: rank == 1 ? 8 : 6),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        publicUser.nameValue,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Text(
                  '${publicUser.followerCount}',
                  style: TextStyle(
                    fontSize: rank == 1 ? 14 : 11,
                    fontWeight: FontWeight.bold,
                    color: colors[rank],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildRankingCard(BuildContext context, dynamic publicUser, dynamic uint8list, int rank) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => RouteUtil.pushPath(
            context,
            UserProfilePage.generatePath(publicUser.uid),
          ),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kContentColorDarkTheme.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: kPrimaryColor.withValues(alpha: 0.2),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withValues(alpha: 0.1),
                  blurRadius: 16,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: rank <= 3 ? kPrimaryColor.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      rank.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: rank <= 3 ? kPrimaryColor : Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CircleImage(
                      uint8list: uint8list,
                      width: 45,
                      height: 45,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              publicUser.nameValue,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (publicUser.isOfficial) ...[
                            const SizedBox(width: 6),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Icon(
                                  Icons.verified,
                                  size: 12,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: 14,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              '${publicUser.followerCount} followers',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kPrimaryColor.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}