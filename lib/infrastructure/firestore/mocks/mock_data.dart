import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/common/maps.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/model/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/model/timeline/timeline.dart';
import 'package:great_talk/utility/aws_s3_utility.dart';
import 'package:great_talk/utility/new_content.dart';

const String mockCurrentUid = "current-user";
final currentUser = NewContent.newUser(mockCurrentUid,
    userName: "M.LO", bio: "すごいAIの開発者です", imageValue: "megami2.jpeg");
final privatetUser = NewContent.newPrivateUser(mockCurrentUid);
final List<PublicUser> mockUsers = [
  PublicUser(
    accountName: "a",
    createdAt: Timestamp.fromDate(DateTime(2023, 7, 12)),
    bio: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '')
        .toJson(),
    blockCount: 0,
    ethAddress: '',
    followerCount: 0,
    followingCount: 0,
    isNFTicon: false,
    isOfficial: false,
    isSuspended: false,
    muteCount: 0,
    postCount: 0,
    links: [],
    ref: FirestoreQueries.userDocRef("a"),
    reportCount: 0,
    score: 0,
    searchToken: returnSearchToken("佐藤 めぐみ"),
    uid: "a",
    updatedAt: Timestamp.fromDate(DateTime(2023, 7, 12)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName(),
            moderationLabels: [],
            moderationModelVersion: '',
            value:
                'https://jp.static.photo-ac.com/assets/img/models/f4f368ea0e6fed24cc298b53199291ab50789.jpg')
        .toJson(),
    userName: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '佐藤めぐみ')
        .toJson(),
    walletAddresses: [],
  ),
  PublicUser(
    accountName: "b",
    createdAt: Timestamp.fromDate(DateTime(2023, 9, 28)),
    bio: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '')
        .toJson(),
    blockCount: 0,
    ethAddress: '',
    followerCount: 10,
    followingCount: 0,
    isNFTicon: false,
    isOfficial: false,
    isSuspended: false,
    muteCount: 0,
    postCount: 0,
    links: [],
    ref: FirestoreQueries.userDocRef("b"),
    reportCount: 0,
    score: 0,
    searchToken: returnSearchToken("田中 久美"),
    uid: "b",
    updatedAt: Timestamp.fromDate(DateTime(2023, 9, 28)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName(),
            moderationLabels: [],
            moderationModelVersion: '',
            value:
                'https://pakutaso.cdn.rabify.me/shared/img/thumb/yuka16011215IMG_5574.jpg.webp?d=350')
        .toJson(),
    userName: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '田中 久美')
        .toJson(),
    walletAddresses: [],
  ),
  PublicUser(
    accountName: "c",
    createdAt: Timestamp.fromDate(DateTime(2023, 3, 13)),
    bio: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '')
        .toJson(),
    blockCount: 0,
    ethAddress: '',
    followerCount: 20,
    followingCount: 0,
    isNFTicon: false,
    isOfficial: false,
    isSuspended: false,
    muteCount: 0,
    postCount: 0,
    links: [],
    ref: FirestoreQueries.userDocRef("c"),
    reportCount: 0,
    score: 0,
    searchToken: returnSearchToken("山岸 愛"),
    uid: "c",
    updatedAt: Timestamp.fromDate(DateTime(2023, 3, 13)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName(),
            moderationLabels: [],
            moderationModelVersion: '',
            value:
                'https://jp.static.photo-ac.com/assets/img/models/1796ee45a8c7c3e2be04c508f26afa3352857.jpg')
        .toJson(),
    userName: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '山岸 愛')
        .toJson(),
    walletAddresses: [],
  ),
  PublicUser(
    accountName: "d",
    createdAt: Timestamp.fromDate(DateTime(2023, 2, 18)),
    bio: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '')
        .toJson(),
    blockCount: 0,
    ethAddress: '',
    followerCount: 30,
    followingCount: 0,
    isNFTicon: false,
    isOfficial: false,
    isSuspended: false,
    muteCount: 0,
    postCount: 0,
    links: [],
    ref: FirestoreQueries.userDocRef("d"),
    reportCount: 0,
    score: 0,
    searchToken: returnSearchToken("森 遥"),
    uid: "d",
    updatedAt: Timestamp.fromDate(DateTime(2023, 2, 18)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName(),
            moderationLabels: [],
            moderationModelVersion: '',
            value:
                'https://jp.static.photo-ac.com/assets/img/models/125b35eae7888d2c9047da770aebabd796386.jpg')
        .toJson(),
    userName: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '森 遥')
        .toJson(),
    walletAddresses: [],
  ),
  PublicUser(
    accountName: "e",
    createdAt: Timestamp.fromDate(DateTime(2023, 6, 1)),
    bio: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '')
        .toJson(),
    blockCount: 0,
    ethAddress: '',
    followerCount: 40,
    followingCount: 0,
    isNFTicon: false,
    isOfficial: false,
    isSuspended: false,
    muteCount: 0,
    postCount: 0,
    links: [],
    ref: FirestoreQueries.userDocRef("e"),
    reportCount: 0,
    score: 0,
    searchToken: returnSearchToken("橋本 美奈"),
    uid: "e",
    updatedAt: Timestamp.fromDate(DateTime(2023, 6, 1)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName(),
            moderationLabels: [],
            moderationModelVersion: '',
            value:
                'https://pakutaso.cdn.rabify.me/shared/img/thumb/02AMEMAN8752.jpg.webp?d=350')
        .toJson(),
    userName: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '橋本 美奈')
        .toJson(),
    walletAddresses: [],
  ),
  PublicUser(
    accountName: "f",
    createdAt: Timestamp.fromDate(DateTime(2023, 2, 23)),
    bio: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '')
        .toJson(),
    blockCount: 0,
    ethAddress: '',
    followerCount: 50,
    followingCount: 0,
    isNFTicon: false,
    isOfficial: false,
    isSuspended: false,
    muteCount: 0,
    postCount: 0,
    links: [],
    ref: FirestoreQueries.userDocRef("f"),
    reportCount: 0,
    score: 0,
    searchToken: returnSearchToken("遠藤 俊夫"),
    uid: "f",
    updatedAt: Timestamp.fromDate(DateTime(2023, 2, 23)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName(),
            moderationLabels: [],
            moderationModelVersion: '',
            value:
                'https://pbs.twimg.com/media/FxY4Yb2aYAATYpt?format=jpg&name=medium')
        .toJson(),
    userName: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '遠藤 俊夫"')
        .toJson(),
    walletAddresses: [],
  ),
  PublicUser(
    accountName: "g",
    createdAt: Timestamp.fromDate(DateTime(2023, 1, 8)),
    bio: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '')
        .toJson(),
    blockCount: 0,
    ethAddress: '',
    followerCount: 60,
    followingCount: 0,
    isNFTicon: false,
    isOfficial: false,
    isSuspended: false,
    muteCount: 0,
    postCount: 0,
    links: [],
    ref: FirestoreQueries.userDocRef("g"),
    reportCount: 0,
    score: 0,
    searchToken: returnSearchToken(
      "井上 清",
    ),
    uid: "g",
    updatedAt: Timestamp.fromDate(DateTime(2023, 1, 8)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName(),
            moderationLabels: [],
            moderationModelVersion: '',
            value:
                'https://pbs.twimg.com/media/FxY4qXTacAAoN8p?format=jpg&name=medium')
        .toJson(),
    userName: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '井上 清')
        .toJson(),
    walletAddresses: [],
  ),
  PublicUser(
    accountName: "h",
    createdAt: Timestamp.fromDate(DateTime(2023, 10, 14)),
    bio: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '')
        .toJson(),
    blockCount: 0,
    ethAddress: '',
    followerCount: 70,
    followingCount: 0,
    isNFTicon: false,
    isOfficial: false,
    isSuspended: false,
    muteCount: 0,
    postCount: 0,
    links: [],
    ref: FirestoreQueries.userDocRef("h"),
    reportCount: 0,
    score: 0,
    searchToken: returnSearchToken(
      "森田 敦",
    ),
    uid: "h",
    updatedAt: Timestamp.fromDate(DateTime(2023, 10, 14)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName(),
            moderationLabels: [],
            moderationModelVersion: '',
            value:
                'https://pbs.twimg.com/media/FxY3qI2aAAAckt6?format=jpg&name=medium')
        .toJson(),
    userName: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '森田 敦')
        .toJson(),
    walletAddresses: [],
  ),
  PublicUser(
    accountName: "i",
    createdAt: Timestamp.fromDate(DateTime(2023, 3, 13)),
    bio: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '')
        .toJson(),
    blockCount: 0,
    ethAddress: '',
    followerCount: 80,
    followingCount: 0,
    isNFTicon: false,
    isOfficial: false,
    isSuspended: false,
    muteCount: 0,
    postCount: 0,
    links: [],
    ref: FirestoreQueries.userDocRef("i"),
    reportCount: 0,
    score: 0,
    searchToken: returnSearchToken(
      "山田 剛史",
    ),
    uid: "i",
    updatedAt: Timestamp.fromDate(DateTime(2023, 3, 13)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName(),
            moderationLabels: [],
            moderationModelVersion: '',
            value:
                'https://pbs.twimg.com/media/FxY2djfaAAYSrjW?format=jpg&name=medium')
        .toJson(),
    userName: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '山田 剛史')
        .toJson(),
    walletAddresses: [],
  ),
  PublicUser(
    accountName: "j",
    createdAt: Timestamp.fromDate(DateTime(2023, 4, 28)),
    bio: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '')
        .toJson(),
    blockCount: 0,
    ethAddress: '',
    followerCount: 90,
    followingCount: 0,
    isNFTicon: false,
    isOfficial: false,
    isSuspended: false,
    muteCount: 0,
    postCount: 0,
    links: [],
    ref: FirestoreQueries.userDocRef("j"),
    reportCount: 0,
    score: 0,
    searchToken: returnSearchToken(
      "中川 裕",
    ),
    uid: "j",
    updatedAt: Timestamp.fromDate(DateTime(2023, 4, 28)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName(),
            moderationLabels: [],
            moderationModelVersion: '',
            value:
                'https://pbs.twimg.com/media/FxY2_ZGaAAE2pBk?format=jpg&name=medium')
        .toJson(),
    userName: const DetectedText(
            languageCode: '',
            negativeScore: 0,
            positiveScore: 0,
            sentiment: '',
            value: '中川 裕')
        .toJson(),
    walletAddresses: [],
  ),
];
final List<Post> mockPosts = [
  Post(
      bookmarkCount: 0,
      createdAt: Timestamp.fromDate(DateTime(2023, 5, 25)),
      customCompleteText:
          const CustomCompleteText(systemPrompt: "語尾に必ず「にゃん」をつけて返答して！")
              .toJson(),
      description: const DetectedText(
              languageCode: '',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: '',
              value: '')
          .toJson(),
      exampleTexts: [],
      genre: '',
      hashTags: [],
      image: DetectedImage(
              bucketName: AWSS3Utility.postImagesBucketName(),
              moderationLabels: [],
              moderationModelVersion: '',
              value:
                  'https://pbs.twimg.com/media/F2F7Fn8bwAABjvr?format=webp&name=small')
          .toJson(),
      impressionCount: 0,
      likeCount: 5,
      links: [],
      msgCount: 87,
      muteCount: 0,
      poster: mockUsers[0].toJson(),
      postId: "post-a",
      ref: mockUsers[0].typedRef().collection("posts").doc("post-a"),
      reportCount: 0,
      score: 0,
      searchToken: returnSearchToken("猫GPT"),
      title: const DetectedText(
              languageCode: '',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: '',
              value: '猫GPT')
          .toJson(),
      updatedAt: Timestamp.fromDate(DateTime(2023, 5, 25)),
      userCount: 0),
  Post(
      bookmarkCount: 0,
      createdAt: Timestamp.fromDate(DateTime(2023, 5, 9)),
      customCompleteText:
          const CustomCompleteText(systemPrompt: "「序論」、「本論」、「結論」に分けて返答してください。")
              .toJson(),
      description: const DetectedText(
              languageCode: '',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: '',
              value: '')
          .toJson(),
      exampleTexts: [],
      genre: '',
      hashTags: [],
      image: DetectedImage(
              bucketName: AWSS3Utility.postImagesBucketName(),
              moderationLabels: [],
              moderationModelVersion: '',
              value:
                  'https://pbs.twimg.com/media/F2F7Gzea4AAaCIv?format=webp&name=small')
          .toJson(),
      impressionCount: 0,
      likeCount: 10,
      links: [],
      msgCount: 102,
      muteCount: 0,
      poster: mockUsers[1].toJson(),
      postId: "post-b",
      ref: mockUsers[1].typedRef().collection("posts").doc("post-b"),
      reportCount: 0,
      score: 0,
      searchToken: returnSearchToken("原稿作成くん"),
      title: const DetectedText(
              languageCode: '',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: '',
              value: '原稿作成くん')
          .toJson(),
      updatedAt: Timestamp.fromDate(DateTime(2023, 5, 9)),
      userCount: 0),
  Post(
      bookmarkCount: 0,
      createdAt: Timestamp.fromDate(DateTime(2023, 2, 22)),
      customCompleteText:
          const CustomCompleteText(systemPrompt: "画期的なアイデアを出しながら返答してください。")
              .toJson(),
      description: const DetectedText(
              languageCode: '',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: '',
              value: '')
          .toJson(),
      exampleTexts: [],
      genre: '',
      hashTags: [],
      image: DetectedImage(
              bucketName: AWSS3Utility.postImagesBucketName(),
              moderationLabels: [],
              moderationModelVersion: '',
              value:
                  'https://pbs.twimg.com/media/F2F7H45bEAEtd9j?format=webp&name=small')
          .toJson(),
      impressionCount: 0,
      likeCount: 20,
      links: [],
      msgCount: 215,
      muteCount: 0,
      poster: mockUsers[2].toJson(),
      postId: "post-c",
      ref: mockUsers[2].typedRef().collection("posts").doc("post-c"),
      reportCount: 0,
      score: 0,
      searchToken: returnSearchToken("アイデア出しまくりAI"),
      title: const DetectedText(
              languageCode: '',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: '',
              value: 'アイデア出しまくりAI')
          .toJson(),
      updatedAt: Timestamp.fromDate(DateTime(2023, 2, 22)),
      userCount: 0),
  Post(
      bookmarkCount: 0,
      createdAt: Timestamp.fromDate(DateTime(2023, 7, 19)),
      customCompleteText:
          const CustomCompleteText(systemPrompt: "以下の質問をソースコードで返答してください。")
              .toJson(),
      description: const DetectedText(
              languageCode: '',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: '',
              value: '')
          .toJson(),
      exampleTexts: [],
      genre: '',
      hashTags: [],
      image: DetectedImage(
              bucketName: AWSS3Utility.postImagesBucketName(),
              moderationLabels: [],
              moderationModelVersion: '',
              value:
                  'https://pbs.twimg.com/media/F2F7I73aAAAqdlz?format=webp&name=small')
          .toJson(),
      impressionCount: 0,
      likeCount: 30,
      links: [],
      msgCount: 368,
      muteCount: 0,
      poster: mockUsers[3].toJson(),
      postId: "post-d",
      ref: mockUsers[3].typedRef().collection("posts").doc("post-a"),
      reportCount: 0,
      score: 0,
      searchToken: returnSearchToken("エンジニアAIくん"),
      title: const DetectedText(
              languageCode: '',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: '',
              value: 'エンジニアAIくん')
          .toJson(),
      updatedAt: Timestamp.fromDate(DateTime(2023, 7, 19)),
      userCount: 0),
  Post(
      bookmarkCount: 0,
      createdAt: Timestamp.fromDate(DateTime(2023, 4, 7)),
      customCompleteText: const CustomCompleteText(
              systemPrompt: "まず、相手に寄り添うようなことを言ってから、返答を続けてください。")
          .toJson(),
      description: const DetectedText(
              languageCode: '',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: '',
              value: '')
          .toJson(),
      exampleTexts: [],
      genre: '',
      hashTags: [],
      image: DetectedImage(
              bucketName: AWSS3Utility.postImagesBucketName(),
              moderationLabels: [],
              moderationModelVersion: '',
              value:
                  'https://pbs.twimg.com/media/F2F7M7naMAA5_PJ?format=webp&name=900x900')
          .toJson(),
      impressionCount: 0,
      likeCount: 40,
      links: [],
      msgCount: 446,
      muteCount: 0,
      poster: mockUsers[4].toJson(),
      postId: "post-e",
      ref: mockUsers[4].typedRef().collection("posts").doc("post-a"),
      reportCount: 0,
      score: 0,
      searchToken: returnSearchToken("なんでも相談AI"),
      title: const DetectedText(
              languageCode: '',
              negativeScore: 0,
              positiveScore: 0,
              sentiment: '',
              value: 'なんでも相談AI')
          .toJson(),
      updatedAt: Timestamp.fromDate(DateTime(2023, 4, 7)),
      userCount: 0),
];
List<Timeline> mockTimelines() {
  final List<Timeline> result = [];
  for (final post in mockPosts) {
    result.add(
      Timeline(
          createdAt: post.createdAt,
          isRead: false,
          posterUid: PublicUser.fromJson(post.poster).uid,
          postId: post.postId),
    );
  }
  return result;
}
