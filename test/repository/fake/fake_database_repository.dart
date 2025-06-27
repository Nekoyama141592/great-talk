import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/repository/database_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/domain/entity/timeline/timeline.dart';
import 'package:great_talk/domain/entity/follower/follower.dart';
import 'package:great_talk/domain/entity/post/post.dart';
import 'package:great_talk/domain/entity/post_like/post_like.dart';
import 'package:great_talk/domain/entity/post_mute/post_mute.dart';
import 'package:great_talk/domain/entity/private_user/private_user.dart';
import 'package:great_talk/domain/entity/public_user/public_user.dart';
import 'package:great_talk/domain/entity/tokens/following_token/following_token.dart';
import 'package:great_talk/domain/entity/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/domain/entity/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/domain/entity/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/domain/entity/user_mute/user_mute.dart';

class FakeDatabaseRepository implements DatabaseRepository {
  FakeDatabaseRepository({
    this.shouldSucceed = true,
    this.errorMessage,
    this.methodFailures = const {},
  });

  // Control flags for overall behavior
  bool shouldSucceed;
  String? errorMessage;
  
  // Method-specific failure control (method name -> should fail)
  Map<String, bool> methodFailures;
  
  // Argument capture for verification
  Map<String, dynamic> capturedArguments = {};
  
  // Mock data storage
  final Map<String, dynamic> _mockData = {};
  final List<String> _methodCallHistory = [];

  // Helper methods for test control
  void reset() {
    shouldSucceed = true;
    errorMessage = null;
    methodFailures.clear();
    capturedArguments.clear();
    _mockData.clear();
    _methodCallHistory.clear();
  }

  void setMethodFailure(String methodName, bool shouldFail) {
    methodFailures[methodName] = shouldFail;
  }

  bool _shouldMethodSucceed(String methodName) {
    return methodFailures[methodName] == true ? false : shouldSucceed;
  }

  void _captureCall(String methodName, Map<String, dynamic> arguments) {
    _methodCallHistory.add(methodName);
    capturedArguments = {
      'method': methodName,
      ...arguments,
    };
  }

  List<String> get methodCallHistory => List.unmodifiable(_methodCallHistory);

  // Override required FirebaseFirestore instance (not used in tests)
  @override
  FirebaseFirestore get instance => throw UnimplementedError('Not needed in tests');

  // Reference getters (not used in tests, return mock values)
  @override
  DocRef get publicV1 => throw UnimplementedError('Not needed in tests');
  
  @override
  DocRef get privateV1 => throw UnimplementedError('Not needed in tests');
  
  @override
  DocRef userDocRef(String uid) => throw UnimplementedError('Not needed in tests');
  
  @override
  DocRef followerDocRef(String currentUid, String passiveUid) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  DocRef privateUserDocRef(String currentUid) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  DocRef postLikeDocRef(DocRef postRef, String activeUid) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  DocRef postReportDocRef(DocRef postRef, String currentUid) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  DocRef postDocRef(String uid, String postId) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  DocRef userUpdateLogDocRef(String uid) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  DocRef postMuteDocRef(DocRef postRef, String currentUid) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  DocRef userMuteDocRef(String uid, String currentUid) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  DocRef tokenDocRef(String currentUid, String tokenId) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  DocRef timelinesDocRef(String currentUid, String postId) => 
      throw UnimplementedError('Not needed in tests');

  // Collection reference getters
  @override
  ColRef usersColRef() => throw UnimplementedError('Not needed in tests');
  
  @override
  ColRef postsColRef(String uid) => throw UnimplementedError('Not needed in tests');
  
  @override
  ColRef tokensColRef(String currentUid) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  ColRef timelinesColRef(DocRef userRef) => 
      throw UnimplementedError('Not needed in tests');

  // Query getters
  @override
  MapQuery usersQuery() => throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery userPostsQuery(String uid) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery postsQuery() => throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery postsByWhereIn(List<String> postIds) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery userPostsByNewest(String uid) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery postsByMsgCount() => throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery postsByNewest() => throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery timelinesQuery(String uid) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery timelinePostsQuery(List<String> timelinePostIds) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery usersByWhereIn(List<String> uids) => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery usersByFollowerCount() => 
      throw UnimplementedError('Not needed in tests');

  // Collection group queries
  @override
  MapQuery usersCollectionGroup() => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery postsCollectionGroup() => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery messagesCollectionGroup() => 
      throw UnimplementedError('Not needed in tests');
  
  @override
  MapQuery searchLogsCollectionGroup() => 
      throw UnimplementedError('Not needed in tests');

  // Post-related methods (used by split use cases)
  @override
  FutureResult<bool> deletePost(Post post) async {
    const methodName = 'deletePost';
    _captureCall(methodName, {'post': post});

    if (_shouldMethodSucceed(methodName)) {
      return const Result.success(true);
    } else {
      return Result.failure(errorMessage ?? 'Database error');
    }
  }

  @override
  FutureResult<bool> createLikePostInfo(
    String currentUid,
    Post post,
    LikePostToken token,
    PostLike postLike,
  ) async {
    const methodName = 'createLikePostInfo';
    _captureCall(methodName, {
      'currentUid': currentUid,
      'post': post,
      'token': token,
      'postLike': postLike,
    });

    if (_shouldMethodSucceed(methodName)) {
      return const Result.success(true);
    } else {
      return Result.failure(errorMessage ?? 'Database error');
    }
  }

  @override
  FutureResult<bool> deleteLikePostInfo(
    String currentUid,
    Post post,
    String tokenId,
  ) async {
    const methodName = 'deleteLikePostInfo';
    _captureCall(methodName, {
      'currentUid': currentUid,
      'post': post,
      'tokenId': tokenId,
    });

    if (_shouldMethodSucceed(methodName)) {
      return const Result.success(true);
    } else {
      return Result.failure(errorMessage ?? 'Database error');
    }
  }

  @override
  FutureResult<bool> createMutePostInfo(
    String currentUid,
    Post post,
    MutePostToken token,
    PostMute postMute,
  ) async {
    const methodName = 'createMutePostInfo';
    _captureCall(methodName, {
      'currentUid': currentUid,
      'post': post,
      'token': token,
      'postMute': postMute,
    });

    if (_shouldMethodSucceed(methodName)) {
      return const Result.success(true);
    } else {
      return Result.failure(errorMessage ?? 'Database error');
    }
  }

  @override
  FutureResult<bool> createMuteUserInfo(
    String currentUid,
    String passiveUid,
    MuteUserToken token,
    UserMute userMute,
  ) async {
    const methodName = 'createMuteUserInfo';
    _captureCall(methodName, {
      'currentUid': currentUid,
      'passiveUid': passiveUid,
      'token': token,
      'userMute': userMute,
    });

    if (_shouldMethodSucceed(methodName)) {
      return const Result.success(true);
    } else {
      return Result.failure(errorMessage ?? 'Database error');
    }
  }

  // User-related methods
  @override
  FutureResult<bool> createPost(
    String uid,
    String postId,
    Map<String, dynamic> json,
  ) async {
    const methodName = 'createPost';
    _captureCall(methodName, {
      'uid': uid,
      'postId': postId,
      'json': json,
    });

    if (_shouldMethodSucceed(methodName)) {
      return const Result.success(true);
    } else {
      return Result.failure(errorMessage ?? 'Database error');
    }
  }

  @override
  Future<PublicUser?> createPublicUser(
    String uid,
    Map<String, dynamic> json,
  ) async {
    const methodName = 'createPublicUser';
    _captureCall(methodName, {'uid': uid, 'json': json});

    if (_shouldMethodSucceed(methodName)) {
      return PublicUser.fromJson(json..['uid'] = uid);
    } else {
      return null;
    }
  }

  @override
  Future<PrivateUser?> createPrivateUser(
    String uid,
    Map<String, dynamic> json,
  ) async {
    const methodName = 'createPrivateUser';
    _captureCall(methodName, {'uid': uid, 'json': json});

    if (_shouldMethodSucceed(methodName)) {
      return PrivateUser.fromJson(json..['uid'] = uid);
    } else {
      return null;
    }
  }

  @override
  FutureResult<bool> deletePublicUser(String uid) async {
    const methodName = 'deletePublicUser';
    _captureCall(methodName, {'uid': uid});

    if (_shouldMethodSucceed(methodName)) {
      return const Result.success(true);
    } else {
      return Result.failure(errorMessage ?? 'Database error');
    }
  }

  // Follow-related methods
  @override
  FutureResult<bool> createFollowInfo(
    String currentUid,
    String passiveUid,
    FollowingToken followingToken,
    Follower follower,
  ) async {
    const methodName = 'createFollowInfo';
    _captureCall(methodName, {
      'currentUid': currentUid,
      'passiveUid': passiveUid,
      'followingToken': followingToken,
      'follower': follower,
    });

    if (_shouldMethodSucceed(methodName)) {
      return const Result.success(true);
    } else {
      return Result.failure(errorMessage ?? 'Database error');
    }
  }

  @override
  FutureResult<bool> deleteFollowInfoList(
    String currentUid,
    String passiveUid,
    String tokenId,
  ) async {
    const methodName = 'deleteFollowInfoList';
    _captureCall(methodName, {
      'currentUid': currentUid,
      'passiveUid': passiveUid,
      'tokenId': tokenId,
    });

    if (_shouldMethodSucceed(methodName)) {
      return const Result.success(true);
    } else {
      return Result.failure(errorMessage ?? 'Database error');
    }
  }

  @override
  FutureResult<bool> deleteMuteUserInfo(
    String currentUid,
    String passiveUid,
    String tokenId,
  ) async {
    const methodName = 'deleteMuteUserInfo';
    _captureCall(methodName, {
      'currentUid': currentUid,
      'passiveUid': passiveUid,
      'tokenId': tokenId,
    });

    if (_shouldMethodSucceed(methodName)) {
      return const Result.success(true);
    } else {
      return Result.failure(errorMessage ?? 'Database error');
    }
  }

  @override
  FutureResult<bool> deleteMutePostInfo(
    String currentUid,
    Post post,
    String tokenId,
  ) async {
    const methodName = 'deleteMutePostInfo';
    _captureCall(methodName, {
      'currentUid': currentUid,
      'post': post,
      'tokenId': tokenId,
    });

    if (_shouldMethodSucceed(methodName)) {
      return const Result.success(true);
    } else {
      return Result.failure(errorMessage ?? 'Database error');
    }
  }

  // Get methods - return mock data or empty results
  @override
  Future<PublicUser?> getPublicUser(String uid) async {
    const methodName = 'getPublicUser';
    _captureCall(methodName, {'uid': uid});

    if (_shouldMethodSucceed(methodName)) {
      final mockUser = _mockData['publicUser_$uid'] as Map<String, dynamic>?;
      return mockUser != null ? PublicUser.fromJson(mockUser) : null;
    } else {
      return null;
    }
  }

  @override
  Future<PrivateUser?> getPrivateUser(String uid) async {
    const methodName = 'getPrivateUser';
    _captureCall(methodName, {'uid': uid});

    if (_shouldMethodSucceed(methodName)) {
      final mockUser = _mockData['privateUser_$uid'] as Map<String, dynamic>?;
      return mockUser != null ? PrivateUser.fromJson(mockUser) : null;
    } else {
      return null;
    }
  }

  @override
  Future<Post?> getPost(String uid, String postId) async {
    const methodName = 'getPost';
    _captureCall(methodName, {'uid': uid, 'postId': postId});

    if (_shouldMethodSucceed(methodName)) {
      final mockPost = _mockData['post_${uid}_$postId'] as Map<String, dynamic>?;
      return mockPost != null ? Post.fromJson(mockPost) : null;
    } else {
      return null;
    }
  }

  // List methods - return mock data or empty lists
  @override
  Future<List<Post>> getUserPosts(String uid) async {
    const methodName = 'getUserPosts';
    _captureCall(methodName, {'uid': uid});

    if (_shouldMethodSucceed(methodName)) {
      final mockPosts = _mockData['userPosts_$uid'] as List<Map<String, dynamic>>?;
      return mockPosts?.map((json) => Post.fromJson(json)).toList() ?? [];
    } else {
      return [];
    }
  }

  @override
  Future<List<PublicUser>> getRankingUsers() async {
    const methodName = 'getRankingUsers';
    _captureCall(methodName, {});

    if (_shouldMethodSucceed(methodName)) {
      final mockUsers = _mockData['rankingUsers'] as List<Map<String, dynamic>>?;
      return mockUsers?.map((json) => PublicUser.fromJson(json)).toList() ?? [];
    } else {
      return [];
    }
  }

  @override
  Future<List<Post>> getPosts(bool isRankingPosts) async {
    const methodName = 'getPosts';
    _captureCall(methodName, {'isRankingPosts': isRankingPosts});

    if (_shouldMethodSucceed(methodName)) {
      final key = isRankingPosts ? 'rankingPosts' : 'newestPosts';
      final mockPosts = _mockData[key] as List<Map<String, dynamic>>?;
      return mockPosts?.map((json) => Post.fromJson(json)).toList() ?? [];
    } else {
      return [];
    }
  }

  @override
  Future<List<Timeline>> getTimelines(String currentUid) async {
    const methodName = 'getTimelines';
    _captureCall(methodName, {'currentUid': currentUid});

    if (_shouldMethodSucceed(methodName)) {
      final mockTimelines = _mockData['timelines_$currentUid'] as List<Map<String, dynamic>>?;
      return mockTimelines?.map((json) => Timeline.fromJson(json)).toList() ?? [];
    } else {
      return [];
    }
  }

  // Helper methods for test setup
  void setMockPublicUser(String uid, Map<String, dynamic> userData) {
    _mockData['publicUser_$uid'] = userData;
  }

  void setMockPrivateUser(String uid, Map<String, dynamic> userData) {
    _mockData['privateUser_$uid'] = userData;
  }

  void setMockPost(String uid, String postId, Map<String, dynamic> postData) {
    _mockData['post_${uid}_$postId'] = postData;
  }

  void setMockUserPosts(String uid, List<Map<String, dynamic>> posts) {
    _mockData['userPosts_$uid'] = posts;
  }

  void setMockRankingUsers(List<Map<String, dynamic>> users) {
    _mockData['rankingUsers'] = users;
  }

  void setMockPosts(List<Map<String, dynamic>> posts, {bool isRanking = false}) {
    final key = isRanking ? 'rankingPosts' : 'newestPosts';
    _mockData[key] = posts;
  }

  void setMockTimelines(String currentUid, List<Map<String, dynamic>> timelines) {
    _mockData['timelines_$currentUid'] = timelines;
  }

  // Count methods
  @override
  Future<int?> countUsers() async {
    const methodName = 'countUsers';
    _captureCall(methodName, {});
    return _shouldMethodSucceed(methodName) ? (_mockData['userCount'] as int? ?? 0) : null;
  }

  @override
  Future<int?> countPosts() async {
    const methodName = 'countPosts';
    _captureCall(methodName, {});
    return _shouldMethodSucceed(methodName) ? (_mockData['postCount'] as int? ?? 0) : null;
  }

  @override
  Future<int?> countMessages() async {
    const methodName = 'countMessages';
    _captureCall(methodName, {});
    return _shouldMethodSucceed(methodName) ? (_mockData['messageCount'] as int? ?? 0) : null;
  }

  // Additional methods from DatabaseRepository that return empty results
  @override
  Future<List<Map<String, dynamic>>> getTokens(String uid) async {
    const methodName = 'getTokens';
    _captureCall(methodName, {'uid': uid});
    return _shouldMethodSucceed(methodName) 
        ? (_mockData['tokens_$uid'] as List<Map<String, dynamic>>? ?? []) 
        : [];
  }

  @override
  Future<List<Post>> getTimelinePosts(List<String> postIds) async {
    const methodName = 'getTimelinePosts';
    _captureCall(methodName, {'postIds': postIds});
    return _shouldMethodSucceed(methodName) ? [] : [];
  }

  @override
  Future<List<PublicUser>> getUsersByUids(List<String> uids) async {
    const methodName = 'getUsersByUids';
    _captureCall(methodName, {'uids': uids});
    return _shouldMethodSucceed(methodName) ? [] : [];
  }

  @override
  Future<List<Post>> getMoreUserPosts(Post lastPost) async {
    const methodName = 'getMoreUserPosts';
    _captureCall(methodName, {'lastPost': lastPost});
    return _shouldMethodSucceed(methodName) ? [] : [];
  }

  @override
  Future<List<PublicUser>> getMoreRankingUsers(PublicUser lastUser) async {
    const methodName = 'getMoreRankingUsers';
    _captureCall(methodName, {'lastUser': lastUser});
    return _shouldMethodSucceed(methodName) ? [] : [];
  }

  @override
  Future<List<PublicUser>> getMuteUsers(List<String> requestUids) async {
    const methodName = 'getMuteUsers';
    _captureCall(methodName, {'requestUids': requestUids});
    return _shouldMethodSucceed(methodName) ? [] : [];
  }

  @override
  Future<List<PublicUser>> getMoreMuteUsers(List<String> requestUids, PublicUser lastUser) async {
    const methodName = 'getMoreMuteUsers';
    _captureCall(methodName, {'requestUids': requestUids, 'lastUser': lastUser});
    return _shouldMethodSucceed(methodName) ? [] : [];
  }

  @override
  Future<List<Post>> getMorePosts(bool isRankingPosts, Post lastPost) async {
    const methodName = 'getMorePosts';
    _captureCall(methodName, {'isRankingPosts': isRankingPosts, 'lastPost': lastPost});
    return _shouldMethodSucceed(methodName) ? [] : [];
  }

  @override
  Future<List<Timeline>> getMoreTimelines(String currentUid, Timeline lastTimeline) async {
    const methodName = 'getMoreTimelines';
    _captureCall(methodName, {'currentUid': currentUid, 'lastTimeline': lastTimeline});
    return _shouldMethodSucceed(methodName) ? [] : [];
  }

  @override
  Future<List<Post>> getMutePosts(List<String> postIds) async {
    const methodName = 'getMutePosts';
    _captureCall(methodName, {'postIds': postIds});
    return _shouldMethodSucceed(methodName) ? [] : [];
  }

  @override
  Future<List<Post>> getMoreMutePosts(List<String> postIds, Post lastPost) async {
    const methodName = 'getMoreMutePosts';
    _captureCall(methodName, {'postIds': postIds, 'lastPost': lastPost});
    return _shouldMethodSucceed(methodName) ? [] : [];
  }

  @override
  FutureResult<bool> createUserUpdateLog(String uid, Map<String, dynamic> json) async {
    const methodName = 'createUserUpdateLog';
    _captureCall(methodName, {'uid': uid, 'json': json});
    return _shouldMethodSucceed(methodName) 
        ? const Result.success(true) 
        : Result.failure(errorMessage ?? 'Database error');
  }
}