import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImageUrlUtil {
  static String _getR2Endpoint() => dotenv.get('R2_ENDPOINT');

  static String getUserImageUrl(String uid) {
    final baseUrl = '${_getR2Endpoint()}/users/$uid';
    return baseUrl;
  }

  static String getPostImageUrl(String uid, String postId) {
    final baseUrl = '${_getR2Endpoint()}/users/$uid/posts/$postId';
    return baseUrl;
  }
}