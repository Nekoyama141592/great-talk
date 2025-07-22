import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:great_talk/presentation/notifier/ranking_users/ranking_users_view_model.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/presentation/page/screen/refresh_screen/users_refresh_screen.dart';
import 'package:great_talk/presentation/component/circle_image/circle_image.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/presentation/page/user_profile_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserRankingScreen extends ConsumerWidget {
  const UserRankingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(rankingUsersViewModelProvider);
    final notifier = ref.read(rankingUsersViewModelProvider.notifier);
    return AsyncScreen(
      asyncValue: asyncValue,
      data: (state) {
        final imageUsers = state.imageUsers;
        return UsersRefreshScreen(
          isEmpty: imageUsers.isEmpty,
          onLoading: notifier.onLoading,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 20,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.leaderboard,
                                color: Colors.amber[600],
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User Ranking',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                  Text(
                                    'Top users by followers',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
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
    
    final colors = {
      1: Colors.amber[400]!,
      2: Colors.grey[400]!,
      3: Colors.brown[300]!,
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
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, -4),
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
                        style: TextStyle(
                          fontSize: rank == 1 ? 13 : 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
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
                    color: rank <= 3 ? Colors.amber[50] : Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      rank.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: rank <= 3 ? Colors.amber[600] : Colors.grey[600],
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
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800],
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
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Icon(
                                  Icons.verified,
                                  size: 12,
                                  color: Colors.blue[600],
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
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              '${publicUser.followerCount} followers',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
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
                    color: Colors.grey[500],
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
