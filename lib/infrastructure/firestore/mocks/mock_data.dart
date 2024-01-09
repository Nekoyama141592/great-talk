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

class MockData {
  static const String currentUid = "current-user";
  static final currentUser = NewContent.newUser(currentUid,
      userName: "M.LO", bio: "すごいAIの開発者です", imageValue: "megami2.jpeg");
  static final privateUser = NewContent.newPrivateUser(currentUid);
}

final List<PublicUser> mockUsers = [
  PublicUser(
    accountName: "a",
    createdAt: Timestamp.fromDate(DateTime(2023, 7, 12)),
    bio: const DetectedText().toJson(),
    ref: FirestoreQueries.userDocRef("a"),
    searchToken: returnSearchToken("佐藤 めぐみ"),
    uid: "a",
    updatedAt: Timestamp.fromDate(DateTime(2023, 7, 12)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName,
            value:
                'https://jp.static.photo-ac.com/assets/img/models/f4f368ea0e6fed24cc298b53199291ab50789.jpg')
        .toJson(),
    userName: const DetectedText(value: '佐藤めぐみ').toJson(),
  ),
  PublicUser(
    accountName: "b",
    createdAt: Timestamp.fromDate(DateTime(2023, 9, 28)),
    bio: const DetectedText().toJson(),
    followerCount: 10,
    followingCount: 0,
    ref: FirestoreQueries.userDocRef("b"),
    searchToken: returnSearchToken("田中 久美"),
    uid: "b",
    updatedAt: Timestamp.fromDate(DateTime(2023, 9, 28)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName,
            value:
                'https://pakutaso.cdn.rabify.me/shared/img/thumb/yuka16011215IMG_5574.jpg.webp?d=350')
        .toJson(),
    userName: const DetectedText(value: '田中 久美').toJson(),
  ),
  PublicUser(
    accountName: "c",
    createdAt: Timestamp.fromDate(DateTime(2023, 3, 13)),
    bio: const DetectedText().toJson(),
    followerCount: 20,
    ref: FirestoreQueries.userDocRef("c"),
    searchToken: returnSearchToken("山岸 愛"),
    uid: "c",
    updatedAt: Timestamp.fromDate(DateTime(2023, 3, 13)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName,
            value:
                'https://jp.static.photo-ac.com/assets/img/models/1796ee45a8c7c3e2be04c508f26afa3352857.jpg')
        .toJson(),
    userName: const DetectedText(value: '山岸 愛').toJson(),
  ),
  PublicUser(
    accountName: "d",
    createdAt: Timestamp.fromDate(DateTime(2023, 2, 18)),
    bio: const DetectedText().toJson(),
    followerCount: 30,
    ref: FirestoreQueries.userDocRef("d"),
    searchToken: returnSearchToken("森 遥"),
    uid: "d",
    updatedAt: Timestamp.fromDate(DateTime(2023, 2, 18)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName,
            value:
                'https://jp.static.photo-ac.com/assets/img/models/125b35eae7888d2c9047da770aebabd796386.jpg')
        .toJson(),
    userName: const DetectedText(value: '森 遥').toJson(),
  ),
  PublicUser(
    accountName: "e",
    createdAt: Timestamp.fromDate(DateTime(2023, 6, 1)),
    bio: const DetectedText().toJson(),
    followerCount: 40,
    ref: FirestoreQueries.userDocRef("e"),
    searchToken: returnSearchToken("橋本 美奈"),
    uid: "e",
    updatedAt: Timestamp.fromDate(DateTime(2023, 6, 1)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName,
            value:
                'https://pakutaso.cdn.rabify.me/shared/img/thumb/02AMEMAN8752.jpg.webp?d=350')
        .toJson(),
    userName: const DetectedText(value: '橋本 美奈').toJson(),
  ),
  PublicUser(
    accountName: "f",
    createdAt: Timestamp.fromDate(DateTime(2023, 2, 23)),
    bio: const DetectedText().toJson(),
    followerCount: 50,
    ref: FirestoreQueries.userDocRef("f"),
    searchToken: returnSearchToken("遠藤 俊夫"),
    uid: "f",
    updatedAt: Timestamp.fromDate(DateTime(2023, 2, 23)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName,
            value:
                'https://pbs.twimg.com/media/FxY4Yb2aYAATYpt?format=jpg&name=medium')
        .toJson(),
    userName: const DetectedText(value: '遠藤 俊夫"').toJson(),
  ),
  PublicUser(
    accountName: "g",
    createdAt: Timestamp.fromDate(DateTime(2023, 1, 8)),
    bio: const DetectedText().toJson(),
    followerCount: 60,
    ref: FirestoreQueries.userDocRef("g"),
    searchToken: returnSearchToken(
      "井上 清",
    ),
    uid: "g",
    updatedAt: Timestamp.fromDate(DateTime(2023, 1, 8)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName,
            value:
                'https://pbs.twimg.com/media/FxY4qXTacAAoN8p?format=jpg&name=medium')
        .toJson(),
    userName: const DetectedText(value: '井上 清').toJson(),
  ),
  PublicUser(
    accountName: "h",
    createdAt: Timestamp.fromDate(DateTime(2023, 10, 14)),
    bio: const DetectedText().toJson(),
    followerCount: 70,
    ref: FirestoreQueries.userDocRef("h"),
    searchToken: returnSearchToken(
      "森田 敦",
    ),
    uid: "h",
    updatedAt: Timestamp.fromDate(DateTime(2023, 10, 14)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName,
            value:
                'https://pbs.twimg.com/media/FxY3qI2aAAAckt6?format=jpg&name=medium')
        .toJson(),
    userName: const DetectedText(value: '森田 敦').toJson(),
  ),
  PublicUser(
    accountName: "i",
    createdAt: Timestamp.fromDate(DateTime(2023, 3, 13)),
    bio: const DetectedText().toJson(),
    followerCount: 80,
    ref: FirestoreQueries.userDocRef("i"),
    searchToken: returnSearchToken(
      "山田 剛史",
    ),
    uid: "i",
    updatedAt: Timestamp.fromDate(DateTime(2023, 3, 13)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName,
            value:
                'https://pbs.twimg.com/media/FxY2djfaAAYSrjW?format=jpg&name=medium')
        .toJson(),
    userName: const DetectedText(value: '山田 剛史').toJson(),
  ),
  PublicUser(
    accountName: "j",
    createdAt: Timestamp.fromDate(DateTime(2023, 4, 28)),
    bio: const DetectedText().toJson(),
    followerCount: 90,
    ref: FirestoreQueries.userDocRef("j"),
    searchToken: returnSearchToken(
      "中川 裕",
    ),
    uid: "j",
    updatedAt: Timestamp.fromDate(DateTime(2023, 4, 28)),
    image: DetectedImage(
            bucketName: AWSS3Utility.userImagesBucketName,
            value:
                'https://pbs.twimg.com/media/FxY2_ZGaAAE2pBk?format=jpg&name=medium')
        .toJson(),
    userName: const DetectedText(value: '中川 裕').toJson(),
  ),
];
final List<Post> mockPosts = [
  Post(
    createdAt: Timestamp.fromDate(DateTime(2023, 5, 25)),
    customCompleteText:
        const CustomCompleteText(systemPrompt: "語尾に必ず「にゃん」をつけて返答して！").toJson(),
    description: const DetectedText().toJson(),
    image: DetectedImage(
            bucketName: AWSS3Utility.postImagesBucketName,
            value:
                'https://pbs.twimg.com/media/F2F7Fn8bwAABjvr?format=webp&name=small')
        .toJson(),
    likeCount: 5,
    msgCount: 87,
    poster: mockUsers[0].toJson(),
    postId: "post-a",
    ref: mockUsers[0].typedRef().collection("posts").doc("post-a"),
    searchToken: returnSearchToken("猫GPT"),
    title: const DetectedText(value: '猫GPT').toJson(),
    updatedAt: Timestamp.fromDate(DateTime(2023, 5, 25)),
  ),
  Post(
    createdAt: Timestamp.fromDate(DateTime(2023, 5, 9)),
    customCompleteText:
        const CustomCompleteText(systemPrompt: "「序論」、「本論」、「結論」に分けて返答してください。")
            .toJson(),
    description: const DetectedText().toJson(),
    image: DetectedImage(
            bucketName: AWSS3Utility.postImagesBucketName,
            value:
                'https://pbs.twimg.com/media/F2F7Gzea4AAaCIv?format=webp&name=small')
        .toJson(),
    likeCount: 10,
    msgCount: 102,
    poster: mockUsers[1].toJson(),
    postId: "post-b",
    ref: mockUsers[1].typedRef().collection("posts").doc("post-b"),
    searchToken: returnSearchToken("原稿作成くん"),
    title: const DetectedText(value: '原稿作成くん').toJson(),
    updatedAt: Timestamp.fromDate(DateTime(2023, 5, 9)),
  ),
  Post(
    createdAt: Timestamp.fromDate(DateTime(2023, 2, 22)),
    customCompleteText:
        const CustomCompleteText(systemPrompt: "画期的なアイデアを出しながら返答してください。")
            .toJson(),
    description: const DetectedText().toJson(),
    image: DetectedImage(
            bucketName: AWSS3Utility.postImagesBucketName,
            value:
                'https://pbs.twimg.com/media/F2F7H45bEAEtd9j?format=webp&name=small')
        .toJson(),
    likeCount: 20,
    msgCount: 215,
    poster: mockUsers[2].toJson(),
    postId: "post-c",
    ref: mockUsers[2].typedRef().collection("posts").doc("post-c"),
    searchToken: returnSearchToken("アイデア出しまくりAI"),
    title: const DetectedText(value: 'アイデア出しまくりAI').toJson(),
    updatedAt: Timestamp.fromDate(DateTime(2023, 2, 22)),
  ),
  Post(
    createdAt: Timestamp.fromDate(DateTime(2023, 7, 19)),
    customCompleteText:
        const CustomCompleteText(systemPrompt: "以下の質問をソースコードで返答してください。")
            .toJson(),
    description: const DetectedText().toJson(),
    image: DetectedImage(
            bucketName: AWSS3Utility.postImagesBucketName,
            value:
                'https://pbs.twimg.com/media/F2F7I73aAAAqdlz?format=webp&name=small')
        .toJson(),
    likeCount: 30,
    msgCount: 368,
    poster: mockUsers[3].toJson(),
    postId: "post-d",
    ref: mockUsers[3].typedRef().collection("posts").doc("post-a"),
    searchToken: returnSearchToken("エンジニアAIくん"),
    title: const DetectedText(value: 'エンジニアAIくん').toJson(),
    updatedAt: Timestamp.fromDate(DateTime(2023, 7, 19)),
  ),
  Post(
    createdAt: Timestamp.fromDate(DateTime(2023, 4, 7)),
    customCompleteText: const CustomCompleteText(
            systemPrompt: "まず、相手に寄り添うようなことを言ってから、返答を続けてください。")
        .toJson(),
    description: const DetectedText().toJson(),
    image: DetectedImage(
            bucketName: AWSS3Utility.postImagesBucketName,
            value:
                'https://pbs.twimg.com/media/F2F7M7naMAA5_PJ?format=webp&name=900x900')
        .toJson(),
    likeCount: 40,
    msgCount: 446,
    poster: mockUsers[4].toJson(),
    postId: "post-e",
    ref: mockUsers[4].typedRef().collection("posts").doc("post-a"),
    searchToken: returnSearchToken("なんでも相談AI"),
    title: const DetectedText(value: 'なんでも相談AI').toJson(),
    updatedAt: Timestamp.fromDate(DateTime(2023, 4, 7)),
  ),
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
