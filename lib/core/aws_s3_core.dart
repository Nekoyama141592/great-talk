class AWSS3Core {
  static String profileObject(String uid) => "$uid/profile.jpg";
  static String postObject(String uid, String postId) =>
      "$uid/posts/$postId.jpg";
}
