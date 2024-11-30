class AWSS3Utility {
  // static const String _endpoint = 's3-ap-northeast-1.amazonaws.com';
  // static const String _region = 'ap-northeast-1';
  static String profileObject(String uid) => "$uid/profile.jpg";
  static String postObject(String uid, String postId) =>
      "$uid/posts/$postId.jpg";
}
